import 'package:event_manager/Authentication/login_screen.dart';
import 'package:event_manager/Events/Event_Widgets/appbar.dart';
import 'package:event_manager/Events/Event_Widgets/featured_event.dart';
import 'package:event_manager/Screens/Add_Event_Screen.dart';
import 'package:event_manager/Screens/event_manage_screen.dart';
import 'package:event_manager/const/data.dart';
import 'package:event_manager/widgets/event_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'dart:ui' as ui;

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 
  runApp( const CollegeEventApp(),
  );
}

class CollegeEventApp extends StatelessWidget {
  const CollegeEventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'College Event Manager',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.light,
      ),
     // home:  const EventDashboard(),
     home: const EventDashboard(),
    );
  }
}

