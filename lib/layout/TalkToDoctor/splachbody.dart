import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_app_test/layout/TalkToDoctor/waitingScreen.dart';

class BodySplashScreen extends StatefulWidget {
  @override
  _BodySplashScreenState createState() => _BodySplashScreenState();
}

class _BodySplashScreenState extends State<BodySplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => WaitScreen()
                //   Scaffold()

                )));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(125.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xFF179FDB),
                Color(0xFF179FDB),
                Color(0xFF21B3E4),
                Color(0xFF2ECBEE),
              ],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Column(
            children: [
              AppBar(
                toolbarHeight: 100,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                //leadingWidth: 30,
                title: Container(
                  width: double.infinity,
                  // height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Frequently asked questions',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Some questions that will help you',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black54,
          // color: Color.fromARGB(127, 127 , 127, 127) ,
          // alignment: Alignment.center,
          height: 500,
          width: double.infinity,

          child: Container(
            //  margin: EdgeInsets.only(top: 10),
            width: 10,
            height: 10,

            child: Image.asset(
              'assets/images/Yoy.png',
              scale: 4,
            ),
          ),
        ),
      ),
    );
  }
}
