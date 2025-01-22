import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String title;
  MaterialColor color;
  IconData icon;
  final String id;

  CategoryModel({
    required this.title,
    required this.color,
    required this.id,
    required this.icon,
  });

  // Create from DocumentSnapshot
  factory CategoryModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CategoryModel(
      id: doc.id,
      title: data['title'] ?? '',
      color: _getColorFromInt(data['color'] ?? 0),
      icon: IconData(data['icon'] ?? 0, fontFamily: 'MaterialIcons'),
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson( ) {
    return {
      'title': title,
      'color':color.value,
      'icon': icon.codePoint,
    };
  }

  // Empty category factory constructor
  static CategoryModel empty() {
    return CategoryModel(title: 'Tech' , color: Colors.red, icon: Icons.computer, id:'1');
  }

  // Helper method to convert int to MaterialColor
  static MaterialColor _getColorFromInt(int colorValue) {
    return Colors.primaries.firstWhere(
      (color) => color.value == colorValue,
      orElse: () => Colors.grey,
    );
  }
}