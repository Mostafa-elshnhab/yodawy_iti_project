import 'package:flutter/material.dart';
import 'layout/StartSlider.dart';
import 'layout/login.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
       );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  splash createState() => splash();
}

class splash extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => StartSlider()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset('assets/images/splash.png')),

    );
  }
}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return FutureBuilder(
//      // Replace the 3 second delay with your initialization code:
//      future: Future.delayed(Duration(seconds: 3)),
//      builder: (context, AsyncSnapshot snapshot) {
//        // Show splash screen while waiting for app resources to load:
//        if (snapshot.connectionState == ConnectionState.waiting) {
//          return MaterialApp(home: Splash());
//        } else {
//          // Loading is done, return the app:
//          return MaterialApp(
//              debugShowCheckedModeBanner: false,
//            home: Mesanger()
//          );
//        }
//      },
//    );
//  }
//}
//class Splash extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Center(
//        child: Container(
//          width: double.infinity,
//          color: Colors.teal,
//          child: Container(
//            alignment: AlignmentDirectional.center,
//            child: Text('Welcom' ,style: TextStyle(
//              fontStyle: FontStyle.italic,
//              fontWeight: FontWeight.bold,
//              fontSize: 30.0,
//            ),),
//          ),
//        ),
//      ),
//    );
//  }
//}
