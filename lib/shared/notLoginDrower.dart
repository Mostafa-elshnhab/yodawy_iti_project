import 'package:flutter/material.dart';
import 'package:flutter_app_test/layout/login.dart';
import 'package:hexcolor/hexcolor.dart';

Widget createNotLoginDrawer(context) => Container(
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
      child: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    width: double.infinity,
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
//                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 100),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 40, end: 40),
                                    child: Image.asset(
                                      'assets/images/logo.png',
                                      width: double.infinity,
                                    ),
                                  ),
                                  Text(
                                    'health care made easy'.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      //fontWeight: FontWeight.bold,
//                    fontFamily: 'Tajawal',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 150),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: MaterialButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen(),
                                            ));
                                      },
                                      child: Text(
                                        'LOG IN',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      minWidth: double.infinity,
                                      height: 50,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Need help? Tap Here!',
                                      style: TextStyle(
                                        color: Colors.white,
                                        decoration: TextDecoration.underline,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                        decorationThickness: 2,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 145,
                        ),
                        Container(
                          margin: EdgeInsetsDirectional.all(20),
                          child: Row(
                            children: [
                              Text('Proudly Developed in Egypt'),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                  width: 23,
                                  height: 15,
                                  child:
                                      Image.asset('assets/images/egypt.png')),
                              SizedBox(
                                width: 15,
                              ),
                              Text('v2.2.1')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
