import 'package:flutter/material.dart';
import '../pages/reservation_page.dart';

void showPaymentSheet(
  BuildContext context,
  double total, {
  required RoomType room,
  required DateTime? checkIn,
  required DateTime? checkOut,
  required bool breakfast,
  required bool spa,
  required bool chauffeur,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.black,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    builder: (_) => Container(
      padding: const EdgeInsets.all(25),
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Secure Payment",
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Text("\$${total.toStringAsFixed(2)}",
              style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 26)),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber),
            onPressed: () {
              Navigator.pop(context); // Close bottom sheet
              // Show full reservation info
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text("Reservation Confirmed"),
                  content: Text(
                    "Suite: ${room.name.toUpperCase()}\n"
                    "Check-In: ${checkIn != null ? "${checkIn.day}/${checkIn.month}/${checkIn.year}" : "N/A"}\n"
                    "Check-Out: ${checkOut != null ? "${checkOut.day}/${checkOut.month}/${checkOut.year}" : "N/A"}\n"
                    "Breakfast: ${breakfast ? "Yes" : "No"}\n"
                    "Spa: ${spa ? "Yes" : "No"}\n"
                    "Chauffeur: ${chauffeur ? "Yes" : "No"}\n"
                    "Total: \$${total.toStringAsFixed(2)}",
                  ),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Close"))
                  ],
                ),
              );
            },
            child: const Text(
              "PAY NOW",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    ),
  );
}