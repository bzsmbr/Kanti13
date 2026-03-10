import 'package:feladat/DateInputField.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BirthDateForm extends StatefulWidget {
  const BirthDateForm({super.key});

  @override
  State<BirthDateForm> createState() => BirthDateFormState();
}

class BirthDateFormState extends State<BirthDateForm> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  DateTime? _selectedDate;
  int? _calculatedAge;

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 18),
      firstDate: DateTime(1900),
      lastDate: now,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.purple,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Colors.purple),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _controller.text = DateFormat('yyyy.MM.dd').format(picked);
        _calculatedAge = _calculateAge(picked);
      });
    }
  }

  int _calculateAge(DateTime birthDate) {
    final today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  bool _isBirthdayToday(DateTime birthDate) {
    final today = DateTime.now();
    return today.month == birthDate.month && today.day == birthDate.day;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Születési dátum",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          DateInputField(controller: _controller, onTap: _pickDate, validator: _validator),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) setState(() {});
            },
            child: const Text("Életkor meghatározása"),
          ),
          const SizedBox(height: 24),
          if (_selectedDate != null && _formKey.currentState?.validate() == true) ...[
            Text("Kiválasztott dátum: ${_controller.text}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text("Életkor: $_calculatedAge év",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
          if (_selectedDate != null && _isBirthdayToday(_selectedDate!) && _formKey.currentState?.validate() == true) ...[
            const SizedBox(height: 20),
            const Text("🎉 Boldog születésnapot! 🎂",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepOrange)),
            const SizedBox(height: 12),
            Image.network("https://cdn-icons-png.flaticon.com/512/3468/3468371.png", height: 120),
          ],
        ],
      ),
    );
  }

  String? _validator(String? value) {
    if (_selectedDate == null) return "A mező kitöltése kötelező!";
    if (_selectedDate!.isAfter(DateTime.now())) return "Nem lehet jövőbeli dátum!";
    if (_calculateAge(_selectedDate!) < 18) return "Legalább 18 évesnek kell lenned!";
    return null;
  }
}