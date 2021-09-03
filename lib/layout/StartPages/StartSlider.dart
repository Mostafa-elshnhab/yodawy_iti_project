import 'package:flutter/material.dart';
import 'package:flutter_app_test/Data/Users/userData.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'genderScreen.dart';
import 'login.dart';

class StartSlider extends StatefulWidget {
  @override
  _StartSliderState createState() => _StartSliderState();
}

class _StartSliderState extends State<StartSlider> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/1.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            ImageSlideshow(
              /// Width of the [ImageSlideshow].
              width: double.infinity,

              /// Height of the [ImageSlideshow].
              height: 350,

              /// The page to show when first creating the [ImageSlideshow].
              initialPage: 0,
              isLoop: true,

              /// The color to paint the indicator.
              indicatorColor: Colors.deepOrange,

              /// The color to paint behind th indicator.
              indicatorBackgroundColor: Colors.grey,

              /// The widgets to display in the [ImageSlideshow].
              /// Add the sample image file into the images folder
              children: [
                Image.asset(
                  'assets/images/2.png',
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                ),
                Image.asset(
                  'assets/images/3.png',
                  width: MediaQuery.of(context).size.width,
                ),
                Image.asset(
                  'assets/images/4.png',
                  width: MediaQuery.of(context).size.width,
                ),
              ],

              /// Called whenever the page in the center of the viewport changes.

              /// Auto scroll interval.
              /// Do not auto scroll with null or 0.
              autoPlayInterval: 3000,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 80,
                child: ElevatedButton(
                  child: Text(
                    'EXPLORE  YODAWY',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GenderScreen()));
                  },
                )),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an acount?',
                      style: TextStyle(fontSize: 15)),
                  TextButton(
                      onPressed: () {
                        isLoggedIn = false;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text('Sign in', style: TextStyle(fontSize: 15)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
