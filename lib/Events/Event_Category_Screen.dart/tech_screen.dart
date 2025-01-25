import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_manager/Models/event_model.dart';
import 'package:event_manager/controller/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

class TechScreen extends StatelessWidget {
  String id;
   TechScreen({Key? key , required this.id}) : super(key: key);
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21), // Dark background
      appBar: AppBar(
        title: Text(
          'Tech Events', 
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.blue.withOpacity(0.5),
                blurRadius: 10,
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xFF1D1E33),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1D1E33),
              Color(0xFF0A0E21),
            ],
          ),
        ),
        child: FutureBuilder<List<EventModel>>(
          future: EventController.instance.getEventById(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: SpinKitPulse(
                  color: Colors.blue,
                  size: 50.0,
                ),
              );
            }
            
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.event_busy, 
                      size: 80, 
                      color: Colors.blue.withOpacity(0.5),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'No Tech Events Available',
                      style: TextStyle(
                        fontSize: 18, 
                        color: Colors.white70,
                        shadows: [
                          Shadow(
                            color: Colors.blue.withOpacity(0.3),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
            
            return ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final event = snapshot.data![index];
                return _TechEventCard(event: event);
              },
            );
          },
        ),
      ),
    );
  }
}

class _TechEventCard extends StatelessWidget {
  final EventModel event;
  
  const _TechEventCard({Key? key, required this.event}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF1D1E33),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.2),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Event Image with Overlay
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: event.imageUrl,
                    height: 420,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: SpinKitPulse(
                        color: Colors.blue,
                        size: 50.0,
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[900],
                      child: Icon(Icons.error, color: Colors.red[300]),
                    ),
                  ),
                  // Gradient Overlay
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              // Event Details
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF1D1E33),
                      Color(0xFF0A0E21),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Event Title with Glow
                    Text(
                      event.title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.blue.withOpacity(0.5),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    
                    // Event Details with Glowing Icons
                    _buildGlowingDetailRow(
                      icon: Icons.calendar_today,
                      text: event.date != null 
                        ? '${event.date!.toLocal().toString().split(' ')[0]}'
                        : 'Date Not Set',
                      glowColor: Colors.blue,
                    ),
                    _buildGlowingDetailRow(
                      icon: Icons.access_time,
                      text: event.time != null 
                        ? event.time!.format(context)
                        : 'Time Not Set',
                      glowColor: Colors.cyan,
                    ),
                    _buildGlowingDetailRow(
                      icon: Icons.location_on,
                      text: event.venue,
                      glowColor: Colors.purple,
                    ),
                    _buildGlowingDetailRow(
                      icon: Icons.person,
                      text: event.organizer,
                      glowColor: Colors.teal,
                    ),
                    
                    SizedBox(height: 20),
                    
                    // Glowing Register Button
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.purple],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () => _launchRegistration(event.registrationLink),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.rocket_launch,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Register Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildGlowingDetailRow({
    required IconData icon,
    required String text,
    required Color glowColor,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: glowColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: glowColor.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Icon(
              icon,
              color: glowColor,
              size: 20,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  void _launchRegistration(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text(
            'Could not launch registration link',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red.withOpacity(0.8),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
  }
}