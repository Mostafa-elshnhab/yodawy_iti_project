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

final List<String> imageList = [
  "https://www.setaswall.com/wp-content/uploads/2018/08/Spiderman-Wallpaper-76-1280x720.jpg",
  "https://lh3.googleusercontent.com/proxy/yL2FmQfZA79S5eIDza9MH2NjKGIKWPOGRHxHdYwiNPcYDW26YmK6qnP01ZDLsBENZpiADc1ohkj3LzVjrwoX8Pb-crT6MYZb3Jp9gy3ZrlET_yvoFS0qtUHLq4DtVPcqIdxPiNWI_j08omBVACv-YJc",
  "https://images.hdqwalls.com/download/spiderman-peter-parker-standing-on-a-rooftop-ix-1280x720.jpg",
  "https://images.wallpapersden.com/image/download/peter-parker-spider-man-homecoming_bGhsa22UmZqaraWkpJRmZ21lrWxnZQ.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvUgui-suS8DgaljlONNuhy4vPUsC_UKvxJQ&usqp=CAU",
];
