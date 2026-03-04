import 'dart:ui';
import 'package:flutter/material.dart';
import 'luxury_header.dart';
import 'glass_card.dart';
import 'room_selector.dart';
import 'date_selector.dart';
import 'services_selector.dart';
import 'price_summary.dart';
import 'payment_sheet.dart';

enum RoomType { presidential, executive, deluxe }

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  RoomType selectedRoom = RoomType.presidential;
  DateTime? checkIn;
  DateTime? checkOut;

  bool breakfast = true;
  bool spa = false;
  bool chauffeur = false;
  bool isAccepted = false;

  double get roomPrice {
    switch (selectedRoom) {
      case RoomType.presidential:
        return 1200;
      case RoomType.executive:
        return 700;
      case RoomType.deluxe:
        return 400;
    }
  }

  int get nights =>
      (checkIn != null && checkOut != null)
          ? checkOut!.difference(checkIn!).inDays
          : 0;

  double get total {
    double extras = 0;
    if (breakfast) extras += 50;
    if (spa) extras += 120;
    if (chauffeur) extras += 200;
    return (roomPrice * nights) + extras;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.network(
              "https://images.unsplash.com/photo-1566073771259-6a8506099945",
              fit: BoxFit.cover,
            ),
          ),

          // Blur
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(color: Colors.black.withOpacity(0.6)),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const LuxuryHeader(),
                  const SizedBox(height: 30),

                  GlassCard(
                    child: Column(
                      children: [
                        RoomSelector(
                          selectedRoom: selectedRoom,
                          onChanged: (room) =>
                              setState(() => selectedRoom = room),
                        ),
                        const Divider(color: Colors.white30),
                        DateSelector(
                          checkIn: checkIn,
                          checkOut: checkOut,
                          onCheckIn: (date) =>
                              setState(() => checkIn = date),
                          onCheckOut: (date) =>
                              setState(() => checkOut = date),
                        ),
                        const Divider(color: Colors.white30),
                        ServicesSelector(
                          breakfast: breakfast,
                          spa: spa,
                          chauffeur: chauffeur,
                          onBreakfastChanged: (v) =>
                              setState(() => breakfast = v),
                          onSpaChanged: (v) =>
                              setState(() => spa = v),
                          onChauffeurChanged: (v) =>
                              setState(() => chauffeur = v),
                        ),
                        const Divider(color: Colors.white30),
                        PriceSummary(
                          nights: nights,
                          total: total,
                        ),
                        SwitchListTile(
                          title: const Text(
                              "Accept Terms & Conditions",
                              style: TextStyle(color: Colors.white70)),
                          value: isAccepted,
                          activeColor: Colors.greenAccent,
                          onChanged: (v) =>
                              setState(() => isAccepted = v),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: isAccepted && nights > 0
                        ? () => showPaymentSheet(
                              context,
                              total,
                              room: selectedRoom,
                              checkIn: checkIn,
                              checkOut: checkOut,
                              breakfast: breakfast,
                              spa: spa,
                              chauffeur: chauffeur,
                            )
                        : null,
                    child: const Text(
                      "PROCEED TO PAYMENT",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}