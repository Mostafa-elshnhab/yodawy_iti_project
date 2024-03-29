import 'package:flutter/material.dart';
import 'package:flutter_app_test/Data/Users/userData.dart';

import '../HomeScreens/Home.dart';

class GenderScreen extends StatefulWidget {
  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  var btnColor = Colors.grey;
  @override
  void initState() {
    super.initState();
    userdata = Usres.getDAta();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5, bottom: 15),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios_rounded)),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            // top: 20,
                            left: 10),
                        child: Text(
                          'Choose your gender to personalize your experience',
                          style: TextStyle(fontSize: 20, height: 1.5),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 170,
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        btnColor = Colors.blue;
                                        Usres.gender = 'male';
                                      });
                                    },
                                    child: Image(
                                      image: AssetImage('assets/images/5.png'),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15))),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 170,
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        btnColor = Colors.blue;
                                        Usres.gender = 'female';
                                      });
                                    },
                                    child: Image(
                                      image: AssetImage('assets/images/6.png'),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 15, right: 15, top: 80),
              child: ElevatedButton(
                  onPressed: () {
                    if (Usres.gender != '') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    }
                  },
                  child: Text(
                    'NEXT',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: btnColor,
                      padding: EdgeInsets.symmetric(vertical: 15))),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
