import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _changeTheme(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: HomeScreen(
        currentTheme: _themeMode,
        onThemeChanged: _changeTheme,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final ThemeMode currentTheme;
  final Function(ThemeMode) onThemeChanged;

  const HomeScreen({
    super.key,
    required this.currentTheme,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Switcher"),
        actions: [
          PopupMenuButton<ThemeMode>(
            icon: const Icon(Icons.color_lens),
            onSelected: onThemeChanged,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: ThemeMode.light,
                child: Row(
                  children: [
                    const Icon(Icons.light_mode),
                    const SizedBox(width: 8),
                    const Text("Light"),
                    if (currentTheme == ThemeMode.light)
                      const Spacer(),
                    if (currentTheme == ThemeMode.light)
                      const Icon(Icons.check, size: 18),
                  ],
                ),
              ),
              PopupMenuItem(
                value: ThemeMode.dark,
                child: Row(
                  children: [
                    const Icon(Icons.dark_mode),
                    const SizedBox(width: 8),
                    const Text("Dark"),
                    if (currentTheme == ThemeMode.dark)
                      const Spacer(),
                    if (currentTheme == ThemeMode.dark)
                      const Icon(Icons.check, size: 18),
                  ],
                ),
              ),
              PopupMenuItem(
                value: ThemeMode.system,
                child: Row(
                  children: [
                    const Icon(Icons.settings),
                    const SizedBox(width: 8),
                    const Text("System Default"),
                    if (currentTheme == ThemeMode.system)
                      const Spacer(),
                    if (currentTheme == ThemeMode.system)
                      const Icon(Icons.check, size: 18),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: const Center(
        child: Text(
          "Tap the palette icon to change theme",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}