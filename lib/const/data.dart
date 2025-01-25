import 'package:event_manager/Events/Event_Category_Screen.dart/academic_screen.dart';
import 'package:event_manager/Events/Event_Category_Screen.dart/cultural_screen.dart';
import 'package:event_manager/Events/Event_Category_Screen.dart/sports_screen.dart';
import 'package:event_manager/Events/Event_Category_Screen.dart/tech_screen.dart';
import 'package:event_manager/Models/category_model.dart';
import 'package:event_manager/Models/event_model.dart';
import 'package:flutter/material.dart';

class Event {
  final String id;
  final String title;
  final String category;
  final DateTime date;
  final String time;
  final String venue;
  final String organizer;
  final String imageUrl;
  final int attendees;
  final bool isPopular;

  Event({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.time,
    required this.venue,
    required this.organizer,
    required this.imageUrl,
    required this.attendees,
    required this.isPopular,
  });
}

class data{
 static  List<CategoryModel> categoryList=[
          CategoryModel(title: 'Tech' , color: Colors.red, icon: Icons.computer, id:'1'),
           CategoryModel(title: 'Cultural' , color: Colors.purple, icon: Icons.music_note, id:'2'),
       
          CategoryModel(title:  'Sports', icon:  Icons.sports_basketball,color: Colors.orange, id:'3'),
          CategoryModel(title:'Academic',icon:  Icons.school,color:  Colors.green, id: '4'),
  ];

   
   
   static Map<int,Widget> categoryWidgets={
     0: TechScreen(id: '1',),
     1:const CulturalScreen(),
     2:const SportsScreen(),
     3:const AcademicScreen(),
   };


  static List<EventModel> events = [
    EventModel(
      id: '1',
      title: 'Tech Innovation Summit 2025',
      category: CategoryModel(title: 'Tech', color: Colors.blue, id: '1', icon: Icons.computer),
      date: DateTime(2025, 1, 20),
      time: const TimeOfDay(hour: 9, minute: 0),
      venue: 'Grand Auditorium',
      organizer: 'Tech Innovation Hub',
      imageUrl: 'assets/tech_event.jpg',
     registrationLink: "hdsahdkashs"
    ),
  
    // Add more events...
  ];
}