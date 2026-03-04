import 'package:flutter/material.dart';

class LuxuryHeader extends StatelessWidget {
  const LuxuryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Icon(Icons.diamond, color: Colors.amber, size: 60),
        SizedBox(height: 10),
        Text(
          "IMPERIAL PALACE",
          style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
        ),
        Text(
          "Ultra Luxury Experience",
          style: TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}