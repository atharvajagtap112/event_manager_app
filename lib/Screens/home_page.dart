import 'package:event_manager/Screens/Add_Event_Screen.dart';
import 'package:event_manager/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _buildAppBar(),
          _buildFeaturedSection(),
          _buildScrollableFeatures(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 180,
      floating: false,
      pinned: true,
      backgroundColor: const Color(0xFF1A1A1A),
      flexibleSpace: FlexibleSpaceBar(
        title: const Text('Campus Diary',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple.withOpacity(0.8), Colors.blue.withOpacity(0.8)],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturedSection() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Featured',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                  colors: [Color(0xFF4A148C), Color(0xFF311B92)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.3),
                    blurRadius: 12,
                    spreadRadius: -2,
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(24),
                  onTap: () => Get.to(() => EventDashboard()),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(Icons.event, size: 32, color: Colors.white),
                        ),
                        const Spacer(),
                        const Text(
                          'Event Management',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Create and manage campus events',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScrollableFeatures() {
    final features = [
      _FeatureItem(
        icon: Icons.video_library,
        title: 'Vlogs',
        subtitle: 'Watch campus life videos',
        gradient: const [Color(0xFF1565C0), Color(0xFF0D47A1)],
        onTap: () {},
      ),
      _FeatureItem(
        icon: Icons.poll,
        title: 'Student Poll',
        subtitle: 'Voice your opinion',
        gradient: const [Color(0xFFE65100), Color(0xFFEF6C00)],
        onTap: () {},
      ),
      _FeatureItem(
        icon: Icons.search,
        title: 'Lost and Found',
        subtitle: 'Find lost items',
        gradient: const [Color(0xFF2E7D32), Color(0xFF1B5E20)],
        onTap: () {},
      ),
      _FeatureItem(
        icon: Icons.newspaper,
        title: 'News',
        subtitle: 'Campus updates',
        gradient: const [Color(0xFFC62828), Color(0xFFB71C1C)],
        onTap: () {},
      ),
      _FeatureItem(
        icon: Icons.quiz,
        title: 'Quizzes',
        subtitle: 'Test your knowledge',
        gradient: const [Color(0xFF00796B), Color(0xFF004D40)],
        onTap: () {},
      ),
      _FeatureItem(
        icon: Icons.chat_bubble,
        title: 'Anonymous Chit Chats',
        subtitle: 'Connect with peers',
        gradient: const [Color(0xFFC2185B), Color(0xFF880E4F)],
        onTap: () {},
      ),
    ];

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
              child: Text(
                'More Features',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
          final feature = features[index - 1];
          return _buildFeatureCard(feature);
        },
        childCount: features.length + 1,
      ),
    );
  }

  Widget _buildFeatureCard(_FeatureItem feature) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: feature.gradient,
          ),
          boxShadow: [
            BoxShadow(
              color: feature.gradient[0].withOpacity(0.3),
              blurRadius: 8,
              spreadRadius: -2,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: feature.onTap,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(feature.icon, color: Colors.white, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          feature.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          feature.subtitle,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white.withOpacity(0.8),
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FeatureItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final List<Color> gradient;
  final VoidCallback onTap;

  _FeatureItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.gradient,
    required this.onTap,
  });
}