import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_app_test/layout/verify.dart';

class SplashScreen extends StatefulWidget {
  String? phone;

  SplashScreen(this.phone);

  @override
  _MyHomePageState createState() => _MyHomePageState(phone: phone!);
}

class _MyHomePageState extends State<SplashScreen> {
  String? phone;
  _MyHomePageState({required this.phone});
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => VerifyScreen(phone))));
  }

  @override
  Widget build(BuildContext context) {

    return Container(
        color: Colors.grey.withOpacity(.8),
        child: Image.asset('assets/images/1.jpg')

        //FlutterLogo(size:MediaQuery.of(context).size.height)
        );
  }
}

/*class SplashScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new  VerifyScreen(),
     // title: new Text('GeeksForGeeks',textScaleFactor: 2,),
      image: new Image.asset('assets/images/1.jpg'),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );

   /* return SplashScreenView(
      navigateRoute: VerifyScreen(),
      duration: 3000,
      imageSize: 130,
      imageSrc: "logo.png",
      backgroundColor: Colors.white,
    );*/
  }
} */
