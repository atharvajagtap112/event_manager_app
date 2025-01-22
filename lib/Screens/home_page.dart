import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Campus Diary',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white )),
        backgroundColor: Colors.blue[700],
        elevation: 0,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          _buildFeatureCard(
            icon: Icons.event,
            title: 'Event\nManagement',
            color: Colors.blue[600],
            onTap: () {
              // Navigate to event management
            },
          ),
          _buildFeatureCard(
            icon: Icons.video_library,
            title: 'Vlogs',
            color: Colors.green[600],
            onTap: () {
              // Navigate to vlogs
            },
          ),
          _buildFeatureCard(
            icon: Icons.poll,
            title: 'Student\nPoll',
            color: Colors.orange[600],
            onTap: () {
              // Navigate to student poll
            },
          ),
          _buildFeatureCard(
            icon: Icons.search,
            title: 'Lost and\nFound',
            color: Colors.purple[600],
            onTap: () {
              // Navigate to lost and found
            },
          ),
          _buildFeatureCard(
            icon: Icons.newspaper,
            title: 'News',
            color: Colors.red[600],
            onTap: () {
              // Navigate to news
            },
          ),
          _buildFeatureCard(
            icon: Icons.quiz,
            title: 'Quizzes',
            color: Colors.teal[600],
            onTap: () {
              // Navigate to quizzes
            },
          ),
          _buildFeatureCard(
            icon: Icons.chat_bubble,
            title: 'Anonymous\nChit Chats',
            color: Colors.pink[600],
            onTap: () {
              // Navigate to chit chats
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required Color? color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color ?? Colors.blue,
                (color ?? Colors.blue).withOpacity(0.7),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}