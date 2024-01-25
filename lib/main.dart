import 'package:flutter/material.dart';
import 'package:notes/screens/display_note.dart';
import '../screens/add_note.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/': (context) => HomeScreen(),
        "/AddNote": (context) => AddNotes(),
        "/ShowNote": (context) => ShowNote(),
      },
    );
  }
}

