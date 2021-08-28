import 'dart:convert';

import 'package:flutter/material.dart';
import 'layout/HomeScreens/Home.dart';
import 'Data/Users/userData.dart';
import 'layout/Cart/CartData.dart';
import 'layout/FavoriteItems/FavData.dart';
import 'layout/StartPages/StartSlider.dart';
import 'layout/StartPages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
import './models/product_model.dart';

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
    List<Map> getCart() {
      List<String> messagesString = prefs.getStringList('CartData') ?? [];
      List<Map> CartMap = [];
      if (messagesString.isNotEmpty) {
        messagesString.forEach((element) {
          CartMap.add(json.decode(element));
        });
      }
      return CartMap;
    }

    List<Map> getfav() {
      List<String> messagesString = prefs.getStringList('favData') ?? [];
      List<Map> getfav = [];
      if (messagesString.isNotEmpty) {
        messagesString.forEach((element) {
          getfav.add(json.decode(element));
        });
      }
      return getfav;
    }

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
        Cart = getCart();
        Fav = getfav();
        print('cart from herrrrrr $Cart');
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
