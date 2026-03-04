import 'package:flutter/material.dart';

class PriceSummary extends StatelessWidget {
  final int nights;
  final double total;

  const PriceSummary({
    super.key,
    required this.nights,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Nights: $nights",
            style:
                const TextStyle(color: Colors.white70)),
        const SizedBox(height: 5),
        Text(
          "Total: \$${total.toStringAsFixed(2)}",
          style: const TextStyle(
              color: Colors.amber,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}