import 'package:flutter/material.dart';
import 'package:event_manager/Models/event_model.dart';
import 'package:event_manager/controller/event_controller.dart';import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class TechScreen extends StatelessWidget {
  const TechScreen({Key? key}) : super(key: key);
   
  @override
  Widget build(BuildContext context) {
    final controller = EventController();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tech Events', 
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.blue[800],
        elevation: 0,
      ),
      body: FutureBuilder<List<EventModel>>(
        future: controller.getEventById("1"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue[800],
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
                    color: Colors.grey[400]
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No Tech Events Available',
                    style: TextStyle(
                      fontSize: 18, 
                      color: Colors.grey[600]
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
    );
  }
}

class _TechEventCard extends StatelessWidget {
  final EventModel event;
  
  const _TechEventCard({Key? key, required this.event}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Event Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: CachedNetworkImage(
              imageUrl: event.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  color: event.category.color,
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          
          // Event Details
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Event Title
                Text(
                  event.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                SizedBox(height: 8),
                
                // Category Chip
                Chip(
                  label: Text(
                    event.category.title,
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: event.category.color,
                  avatar: Icon(
                    event.category.icon, 
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                SizedBox(height: 8),
                
                // Event Details
                _buildDetailRow(
                  icon: Icons.calendar_today,
                  text: event.date != null 
                    ? '${event.date!.toLocal().toString().split(' ')[0]}'
                    : 'Date Not Set',
                  color: Colors.green,
                ),
                _buildDetailRow(
                  icon: Icons.access_time,
                  text: event.time != null 
                    ? event.time!.format(context)
                    : 'Time Not Set',
                  color: Colors.orange,
                ),
                _buildDetailRow(
                  icon: Icons.location_on,
                  text: event.venue,
                  color: Colors.red,
                ),
                _buildDetailRow(
                  icon: Icons.person,
                  text: event.organizer,
                  color: Colors.purple,
                ),
                
                SizedBox(height: 16),
                
                // Registration Button
                ElevatedButton.icon(
                  onPressed: () => _launchRegistration(event.registrationLink),
                  icon: Icon(Icons.open_in_browser),
                  label: Text('Register Now'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildDetailRow({
    required IconData icon, 
    required String text, 
    required Color color
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
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
      // Handle error
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Could not launch registration link')),
      );
    }
  }
}