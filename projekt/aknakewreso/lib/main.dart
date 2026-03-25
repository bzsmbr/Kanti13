import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(const MinesweeperApp());
}

class MinesweeperApp extends StatelessWidget {
  const MinesweeperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F172A),
      ),
      home: const GamePage(),
    );
  }
}

enum Difficulty { easy, medium, hard }

extension DifficultyExtension on Difficulty {
  int get size {
    switch (this) {
      case Difficulty.easy:
        return 8;
      case Difficulty.medium:
        return 12;
      case Difficulty.hard:
        return 16;
    }
  }

  int get mines {
    switch (this) {
      case Difficulty.easy:
        return 10;
      case Difficulty.medium:
        return 25;
      case Difficulty.hard:
        return 50;
    }
  }

  String get label {
    switch (this) {
      case Difficulty.easy:
        return "Könnyű";
      case Difficulty.medium:
        return "Közepes";
      case Difficulty.hard:
        return "Nehéz";
    }
  }
}

class Cell {
  bool isMine;
  bool isRevealed;
  bool isFlagged;
  int neighborMines;

  Cell(
      {this.isMine = false,
      this.isRevealed = false,
      this.isFlagged = false,
      this.neighborMines = 0});
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> with SingleTickerProviderStateMixin {
  Difficulty difficulty = Difficulty.easy;

  late List<List<Cell>> board;
  bool gameOver = false;
  bool gameWon = false;

  int seconds = 0;
  Timer? timer;

  late AnimationController winController;
  late Animation<double> scaleAnim;

  int get size => difficulty.size;
  int get mineCount => difficulty.mines;

  @override
  void initState() {
    super.initState();

    winController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    scaleAnim = CurvedAnimation(parent: winController, curve: Curves.elasticOut);

    initGame();
  }

  @override
  void dispose() {
    timer?.cancel();
    winController.dispose();
    super.dispose();
  }

  void startTimer() {
    timer?.cancel();
    seconds = 0;
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => seconds++);
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  void initGame() {
    board = List.generate(size, (_) => List.generate(size, (_) => Cell()));
    gameOver = false;
    gameWon = false;
    winController.reset();
    startTimer();

    final rand = Random();
    int placed = 0;
    while (placed < mineCount) {
      int r = rand.nextInt(size);
      int c = rand.nextInt(size);
      if (!board[r][c].isMine) {
        board[r][c].isMine = true;
        placed++;
      }
    }

    for (int r = 0; r < size; r++) {
      for (int c = 0; c < size; c++) {
        if (!board[r][c].isMine) {
          board[r][c].neighborMines = countNeighbors(r, c);
        }
      }
    }
  }

  int countNeighbors(int row, int col) {
    int count = 0;
    for (int dr = -1; dr <= 1; dr++) {
      for (int dc = -1; dc <= 1; dc++) {
        int nr = row + dr;
        int nc = col + dc;
        if (nr >= 0 && nr < size && nc >= 0 && nc < size) {
          if (board[nr][nc].isMine) count++;
        }
      }
    }
    return count;
  }

  void checkWin() {
    for (var row in board) {
      for (var cell in row) {
        if (!cell.isMine && !cell.isRevealed) return;
      }
    }

    gameWon = true;
    stopTimer();
    winController.forward();
  }

  void reveal(int row, int col) {
    final cell = board[row][col];
    if (gameOver || gameWon || cell.isRevealed || cell.isFlagged) return;

    setState(() {
      cell.isRevealed = true;

      if (cell.isMine) {
        gameOver = true;
        stopTimer();
        revealAll();
      } else {
        if (cell.neighborMines == 0) {
          for (int dr = -1; dr <= 1; dr++) {
            for (int dc = -1; dc <= 1; dc++) {
              int nr = row + dr;
              int nc = col + dc;
              if (nr >= 0 && nr < size && nc >= 0 && nc < size) {
                reveal(nr, nc);
              }
            }
          }
        }
        checkWin();
      }
    });
  }

  void toggleFlag(int row, int col) {
    final cell = board[row][col];
    if (cell.isRevealed || gameWon) return;

    setState(() {
      cell.isFlagged = !cell.isFlagged;
    });
  }

  void revealAll() {
    for (var row in board) {
      for (var cell in row) {
        cell.isRevealed = true;
      }
    }
  }

  Widget buildCell(int row, int col) {
    final cell = board[row][col];
    Color color = cell.isRevealed ? const Color(0xFF1E293B) : const Color(0xFF3B82F6);

    return Listener(
      onPointerDown: (event) {
        if (event.kind == PointerDeviceKind.mouse &&
            event.buttons == kSecondaryMouseButton) {
          toggleFlag(row, col);
        }
      },
      child: GestureDetector(
        onTap: () => reveal(row, col),
        onLongPress: () => toggleFlag(row, col),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: cell.isRevealed
                  ? [color.withOpacity(0.9), color]
                  : [color, color.withOpacity(0.8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: cell.isRevealed
                ? []
                : const [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2, 2),
                      blurRadius: 2,
                    ),
                  ],
          ),
          child: Center(
            child: cell.isRevealed
                ? (cell.isMine
                    ? const Icon(Icons.warning, color: Colors.red, size: 24)
                    : Text(
                        cell.neighborMines > 0 ? '${cell.neighborMines}' : '',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ))
                : (cell.isFlagged
                    ? const Icon(Icons.flag, color: Colors.orange)
                    : const SizedBox()),
          ),
        ),
      ),
    );
  }

  Widget buildWinOverlay() {
    if (!gameWon) return const SizedBox();

    return Container(
      color: Colors.black54,
      child: Center(
        child: ScaleTransition(
          scale: scaleAnim,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('🎉 NYERTÉL!',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Text('⏱️ Idő: $seconds s', style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => setState(initGame),
                  child: const Text('Új játék'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('💣 Aknakereső'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          DropdownButton<Difficulty>(
            value: difficulty,
            dropdownColor: Colors.black,
            onChanged: (d) {
              if (d != null) {
                setState(() {
                  difficulty = d;
                  initGame();
                });
              }
            },
            items: Difficulty.values
                .map((d) => DropdownMenuItem(
                      value: d,
                      child: Text(d.label),
                    ))
                .toList(),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => setState(initGame),
          )
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('⏱️ $seconds s'),
                      Text('💣 $mineCount'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: GridView.builder(
                      itemCount: size * size,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: size,
                      ),
                      itemBuilder: (context, index) {
                        int row = index ~/ size;
                        int col = index % size;
                        return buildCell(row, col);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          buildWinOverlay(),
        ],
      ),
    );
  }
}