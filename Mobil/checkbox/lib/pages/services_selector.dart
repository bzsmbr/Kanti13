import 'package:flutter/material.dart';

class ServicesSelector extends StatelessWidget {
  final bool breakfast;
  final bool spa;
  final bool chauffeur;
  final Function(bool) onBreakfastChanged;
  final Function(bool) onSpaChanged;
  final Function(bool) onChauffeurChanged;

  const ServicesSelector({
    super.key,
    required this.breakfast,
    required this.spa,
    required this.chauffeur,
    required this.onBreakfastChanged,
    required this.onSpaChanged,
    required this.onChauffeurChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          title: const Text("Gourmet Breakfast",
              style: TextStyle(color: Colors.white)),
          value: breakfast,
          activeColor: Colors.amber,
          onChanged: (v) => onBreakfastChanged(v!),
        ),
        CheckboxListTile(
          title: const Text("Premium Spa",
              style: TextStyle(color: Colors.white)),
          value: spa,
          activeColor: Colors.amber,
          onChanged: (v) => onSpaChanged(v!),
        ),
        SwitchListTile(
          title: const Text("Private Chauffeur",
              style: TextStyle(color: Colors.white)),
          value: chauffeur,
          activeColor: Colors.amber,
          onChanged: (v) => onChauffeurChanged(v),
        ),
      ],
    );
  }
}