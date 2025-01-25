import 'package:event_manager/Screens/event_manage_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

