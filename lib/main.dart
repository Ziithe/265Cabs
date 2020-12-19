import 'package:app_265cab/views/profile.dart';
import 'package:app_265cab/views/signup.dart';
import 'package:colour/colour.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:app_265cab/views/landingpage.dart';
import 'package:app_265cab/views/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '+265Cabs Landing Page',
      theme: ThemeData(
          fontFamily: "PTSerif",
          primaryColor: Colour('#daa520'),
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: LandingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
