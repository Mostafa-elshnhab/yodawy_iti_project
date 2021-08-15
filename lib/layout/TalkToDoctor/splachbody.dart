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

     Timer(Duration(seconds:2),
             ()=>Navigator.pushReplacement(context,
             MaterialPageRoute(builder:
                 (context) =>


                     WaitScreen()
             //   Scaffold()




             )
         )
     );
       }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        // backgroundColor: Colors.redAccent,
        title: Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              GestureDetector(
                child: Icon(
                  Icons.arrow_back_ios_rounded ,
                ),
                onTap: (){
                  //  print('hi');
                },
              ),
              SizedBox(height: 15,) ,

              Text('Frequently asked questions' , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.w600), ),
              Text('Some questions that will help you' , style: TextStyle(fontSize: 16  ,
              ), ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,







      ),


      body: SingleChildScrollView(

        child: Container(
         color: Colors.black54  ,
         // color: Color.fromARGB(127, 127 , 127, 127) ,
         // alignment: Alignment.center,
         height: 500,
          width: double.infinity ,


          child: Container(
           //  margin: EdgeInsets.only(top: 10),
              width: 10 ,
               height: 10 ,

              child: Image.asset('assets/images/Yoy.png' , scale: 4,) ,),

        ),
      ),










    );
  }
}
