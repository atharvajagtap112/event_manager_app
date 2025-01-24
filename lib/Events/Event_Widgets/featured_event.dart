import 'package:event_manager/Events/Event_Widgets/event_tag.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class FeaturedEvent extends StatelessWidget {
  
  const FeaturedEvent({super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blue.shade400,
                      Colors.purple.shade400,
                    ],
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Featured Event',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Tech Innovation Summit 2025',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const SizedBox(
                  width: double.infinity,
                  child: Row(
                   
                    children: [
                      EventDetail(icon: Icons.calendar_today,text:  '20 Jan'),
                       SizedBox(width: 16),
                      EventDetail(icon:  Icons.location_on,text:  'Grand Auditorium'),
                      
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );;
  }
}