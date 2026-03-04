import 'package:flutter/material.dart';

class DateSelector extends StatelessWidget {
  final DateTime? checkIn;
  final DateTime? checkOut;
  final Function(DateTime) onCheckIn;
  final Function(DateTime) onCheckOut;

  const DateSelector({
    super.key,
    required this.checkIn,
    required this.checkOut,
    required this.onCheckIn,
    required this.onCheckOut,
  });

  Future<void> pickDate(
      BuildContext context, bool isCheckIn) async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );

    if (picked != null) {
      isCheckIn ? onCheckIn(picked) : onCheckOut(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text("Check-In",
              style: TextStyle(color: Colors.white)),
          trailing: Text(
            checkIn == null
                ? "Select"
                : "${checkIn!.day}/${checkIn!.month}/${checkIn!.year}",
            style: const TextStyle(color: Colors.amber),
          ),
          onTap: () => pickDate(context, true),
        ),
        ListTile(
          title: const Text("Check-Out",
              style: TextStyle(color: Colors.white)),
          trailing: Text(
            checkOut == null
                ? "Select"
                : "${checkOut!.day}/${checkOut!.month}/${checkOut!.year}",
            style: const TextStyle(color: Colors.amber),
          ),
          onTap: () => pickDate(context, false),
        ),
      ],
    );
  }
}