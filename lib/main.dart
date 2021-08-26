import 'package:flutter/material.dart';
import 'package:flutter_app_test/layout/Home.dart';
import 'Data/Users/userData.dart';
import 'layout/StartSlider.dart';
import 'layout/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    super.initState();
    autoLogIn();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => isLoggedIn ? MyHomePage() : StartSlider()));
    });
  }

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? Phone = prefs.getString('phone');
    final String? name = prefs.getString('name');
    final String? gender = prefs.getString('gender');
    final List? usreData = prefs.getStringList('usredata');
    if (Phone != '') {
      print(Phone);
      setState(() {
        isLoggedIn = true;
        print('jgjhgjhgjhgjh$Phone');
        Usres.phone = Phone;
        Usres.gender = gender;
        Usres.name = name;
        userdata = usreData!.cast<String>();
        print('jgjhgjhgjhgjh$userdata');
        print('jgjhgjhgjhgjh$name');
      });
      return;
    }
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
