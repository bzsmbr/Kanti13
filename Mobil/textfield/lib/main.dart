import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Georgia', // gives similar serif feel
      ),
      home: const RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  String _result = "";

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _result =
            "Name: ${_nameController.text}\nAge: ${_ageController.text}";
      });
    }
  }

  void _clear() {
    _nameController.clear();
    _ageController.clear();
    setState(() {
      _result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F1EB), // soft beige
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: const Color(0xFF2F5D50), // green border
                width: 1.2,
              ),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Column(
                      children: [
                        Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Fill in your details below",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  /// FULL NAME
                  const Text(
                    "Full Name",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: "e.g. Alexandra Johnson",
                      prefixIcon: const Icon(Icons.person_outline),
                      filled: true,
                      fillColor: const Color(0xFFE6F0EC),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your full name";
                      }
                      if (value.length < 15) {
                        return "Minimum 15 characters required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Minimum 15 characters",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),

                  const SizedBox(height: 20),

                  /// AGE
                  const Text(
                    "Age",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "e.g. 25",
                      prefixIcon: const Icon(Icons.cake_outlined),
                      filled: true,
                      fillColor: const Color(0xFFE6F0EC),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your age";
                      }
                      final age = int.tryParse(value);
                      if (age == null) {
                        return "Enter a valid number";
                      }
                      if (age < 18) {
                        return "Must be 18 or older";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Must be 18 or older",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),

                  const SizedBox(height: 30),

                  /// SUBMIT BUTTON
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2F5D50),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "SUBMIT",
                        style: TextStyle(
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  Center(
                    child: TextButton(
                      onPressed: _clear,
                      child: const Text(
                        "Clear Form",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),

                  if (_result.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        _result,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}