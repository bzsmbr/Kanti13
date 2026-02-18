import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DropdownButtonExample(),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() {
    return _DropdownButtonExampleState();
  }
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  List<String> subjects = [
    'Magyar nyelv és irodalom',
    'Matematika',
    'Történelem',
    'Angol nyelv',
    'Informatika'
  ];

  List<String> levels = [
    'Középszint',
    'Emelt szint'
  ];

  late String selectedSubject;
  late String selectedLevel;

  @override
  void initState() {
    super.initState();
    selectedSubject = subjects[0];
    selectedLevel = levels[0];
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final dropdownWidth = screenWidth * 0.4;

    OutlineInputBorder customBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Érettségi választó'),
        centerTitle: true,
        backgroundColor: const Color(0xFF8E4585), // plum
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              'Válaszd ki a tantárgyat:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),

            SizedBox(
              width: dropdownWidth,
              child: DropdownButtonFormField<String>(
                value: selectedSubject,
                decoration: InputDecoration(
                  enabledBorder: customBorder,
                  focusedBorder: customBorder,
                  border: customBorder,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedSubject = newValue!;
                  });
                },
                items: subjects
                    .map((value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Válaszd ki a szintet:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),

            SizedBox(
              width: dropdownWidth,
              child: DropdownButtonFormField<String>(
                value: selectedLevel,
                decoration: InputDecoration(
                  enabledBorder: customBorder,
                  focusedBorder: customBorder,
                  border: customBorder,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedLevel = newValue!;
                  });
                },
                items: levels
                    .map((value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
              ),
            ),

            const SizedBox(height: 40),

            Text(
              'Választásod:\n$selectedSubject - $selectedLevel',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
