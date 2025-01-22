import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_manager/Models/category_model.dart';
import 'package:flutter/material.dart';

class EventModel {
  final String? id;
  final String title;
  final CategoryModel category;
  final String venue;
  final String organizer;
   String imageUrl;
  
  final String registrationLink;
  final DateTime? date;
  final TimeOfDay? time;

  EventModel({
    this.id,
    required this.title,
    required this.category,
    required this.venue,
    required this.organizer,
    required this.imageUrl,
 
    required this.registrationLink,
    this.date,
    this.time,
  });

  // Create empty constructor
  factory EventModel.empty() => EventModel(
        title: '',
        category: CategoryModel.empty(),  
        venue: '',
        organizer: '',
        imageUrl: '',
       
        registrationLink: '',
      );

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category': category.toJson() ,
      'venue': venue,
      'organizer': organizer,
      'imageUrl': imageUrl,
   
      'registrationLink': registrationLink,
      'date': date?.millisecondsSinceEpoch,
      'time': time != null ? '${time!.hour}:${time!.minute}' : null,
    };
  }

  // Create from DocumentSnapshot
  factory EventModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()! ;
    return EventModel(
      id: doc.id,
      title: data['title'] ?? '',
      category: data['category'] ?? '',
      venue: data['venue'] ?? '',
      organizer: data['organizer'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
     
      registrationLink: data['registrationLink'] ?? '',
      date: data['date'] != null 
          ? DateTime.fromMillisecondsSinceEpoch(data['date']) 
          : null,
      time: data['time'] != null 
          ? _parseTimeOfDay(data['time']) 
          : null,
    );
  }

  // Helper method to parse TimeOfDay from string
  static TimeOfDay? _parseTimeOfDay(String? timeString) {
    if (timeString == null) return null;
    final parts = timeString.split(':');
    if (parts.length != 2) return null;
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }

  // Copy with method
  EventModel copyWith({
    String? title,
    String? category,
    String? venue,
    String? organizer,
    String? imageUrl,
    int? attendees,
    String? registrationLink,
    DateTime? date,
    TimeOfDay? time,
  }) {
    return EventModel(
      id: id,
      title: title ?? this.title,
      category:  this.category,
      venue: venue ?? this.venue,
      organizer: organizer ?? this.organizer,
      imageUrl: imageUrl ?? this.imageUrl,
      
      registrationLink: registrationLink ?? this.registrationLink,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }
}