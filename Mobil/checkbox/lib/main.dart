import 'package:flutter/material.dart';
import 'pages/reservation_page.dart';

void main() {
  runApp(const UltraLuxuryHotelApp());
}

class UltraLuxuryHotelApp extends StatelessWidget {
  const UltraLuxuryHotelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReservationPage(),
    );
  }
}