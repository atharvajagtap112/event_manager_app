import 'package:flutter/material.dart';

class EventAppbar extends StatelessWidget {
  const EventAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return   
     SliverAppBar(
      expandedHeight: 120.0,
      floating: true,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          'Campus Events',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue.shade50,
                Colors.white,
              ],
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.person_outline),
          onPressed: () {},
        ),
      ],
    );
  }
  }
