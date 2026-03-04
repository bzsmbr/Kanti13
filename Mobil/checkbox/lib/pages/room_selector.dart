import 'package:flutter/material.dart';
import '../../pages/reservation_page.dart';

class RoomSelector extends StatelessWidget {
  final RoomType selectedRoom;
  final Function(RoomType) onChanged;

  const RoomSelector({
    super.key,
    required this.selectedRoom,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: RoomType.values.map((room) {
        return RadioListTile<RoomType>(
          title: Text(
            room.name.toUpperCase(),
            style: const TextStyle(color: Colors.white),
          ),
          value: room,
          groupValue: selectedRoom,
          activeColor: Colors.amber,
          onChanged: (value) => onChanged(value!),
        );
      }).toList(),
    );
  }
}