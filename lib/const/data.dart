import 'package:event_manager/Models/category_model.dart';
import 'package:event_manager/main.dart';
import 'package:flutter/material.dart';

class data{
 static  List<CategoryModel> categoryList=[
          CategoryModel(title: 'Tech' , color: Colors.red, icon: Icons.computer, id:'1'),
           CategoryModel(title: 'Cultural' , color: Colors.purple, icon: Icons.music_note, id:'2'),
       
          CategoryModel(title:  'Sports', icon:  Icons.sports_basketball,color: Colors.orange, id:'3'),
          CategoryModel(title:'Academic',icon:  Icons.school,color:  Colors.green, id: '4'),
  ];

  static List<Event> events = [
    Event(
      id: '1',
      title: 'Tech Innovation Summit 2025',
      category: 'tech',
      date: DateTime(2025, 1, 20),
      time: '10:00 AM',
      venue: 'Grand Auditorium',
      organizer: 'Tech Innovation Hub',
      imageUrl: 'assets/tech_event.jpg',
      attendees: 450,
      isPopular: true,
    ),
    Event(
      id: '2',
      title: 'Cultural Extravaganza',
      category: 'cultural',
      date: DateTime(2025, 1, 25),
      time: '6:00 PM',
      venue: 'Open Air Theatre',
      organizer: 'Arts & Culture Society',
      imageUrl: 'assets/cultural_event.jpg',
      attendees: 800,
      isPopular: true,
    ),
    // Add more events...
  ];
}