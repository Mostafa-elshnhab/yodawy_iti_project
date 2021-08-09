import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/layout/welcomescreen.dart';

import 'package:flutter_verification_code/flutter_verification_code.dart';

class VerifyScreen extends StatefulWidget {
  String? phone;

  VerifyScreen(this.phone);

  @override
  _VerifyScreenState createState() => _VerifyScreenState(phone);
}

class _VerifyScreenState extends State<VerifyScreen> {
  String? phone;

  _VerifyScreenState(this.phone);

  var _code;
  var _onEditing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
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
                      left: 5),
                  child: Column(children: <Widget>[
                    Text(
                      "Enter the 4-digit code send to ",
                      style: TextStyle(
                        fontSize: 19,
                        letterSpacing: .5,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 18),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                " you at ",
                                style: TextStyle(
                                  fontSize: 19,
                                  letterSpacing: .5,
                                ),
                              ),
                              Text("+20 $phone",
                                  style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    )
                  ]),

                  //////////////////////////
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Container(
                    child: VerificationCode(
                      textStyle: TextStyle(fontSize: 20.0, color: Colors.blue),
                      underlineColor: Colors.blue,
                      keyboardType: TextInputType.number,
                      length: 4,
                      // clearAll is NOT required, you can delete it
                      // takes any widget, so you can implement your design
                      clearAll: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '',
                          style: TextStyle(
                              fontSize: 14.0,
                              decoration: TextDecoration.underline,
                              color: Colors.blue[700]),
                        ),
                      ),
                      onCompleted: (String value) {
                        setState(() {
                          _code = value;
                        });
                      },
                      onEditing: (bool value) {
                        setState(() {
                          _onEditing = value;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      'Resend code in 00:00:01',
                      style: TextStyle(color: Colors.grey),
                    )),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 170),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeScreen()),
                        );
                      },
                      child: Text(
                        'NEXT',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      style: ElevatedButton.styleFrom(

                          //   primary:  ,
                          padding: EdgeInsets.symmetric(vertical: 15))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
