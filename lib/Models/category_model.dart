import 'dart:ui';

import 'package:flutter/material.dart';

class CategoryModel{
  String title;
  MaterialColor color;
  IconData icon;
  final String id;  
   CategoryModel({
    required this.title,
    required this.color,
    required this.id, 
    required this.icon
   }
    
   );

}