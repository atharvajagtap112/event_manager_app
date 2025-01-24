import 'package:flutter/material.dart';

class EventDetail extends StatelessWidget {
  final IconData icon;
   final String text; 
  const EventDetail({super.key , required this.icon, required this.text});
    
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.black),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}