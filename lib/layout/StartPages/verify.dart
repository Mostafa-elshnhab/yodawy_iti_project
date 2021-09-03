import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/Data/Auth/PhonAuth/authServes.dart';
import 'package:flutter_app_test/Data/Users/userData.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  _VerifyScreenState();

  String? _code;
  var _onEditing;
  Color color = Colors.grey;
  AuthClass authClass = AuthClass();
  String verificationIdFinal = "";
  String smsCode = "";
  int start = 60;
  bool wait = false;
  String buttonName = "Send";
  TextEditingController varityController = TextEditingController();
  @override
  void initState() {
    super.initState();
    setState(() {
      start = 60;
      wait = true;
      buttonName = "Resend";
    });
    authClass
        .verifyPhoneNumber("+2 ${Usres.phone}", context, setData)
        .then((value) => print('sasa'));
    startTimer();
  }

  final FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Form(
            key: FormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        margin: EdgeInsets.only(top: 5, bottom: 15),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_back_ios_rounded)),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            // top: 20,
                            left: 5),
                        child: Column(children: <Widget>[
                          Text(
                            "Enter the 6-digit code send to ",
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
                                    Text("+20 ${Usres.phone}",
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
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: varityController,
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.blue),
                            maxLength: 6,
                            onChanged: (value) {
                              setState(() {
                                if (value.length == 6) {
                                  _code = varityController.text;
                                  color = Colors.blue;
                                  smsCode = varityController.text;
                                }
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty && value.length != 6) {
                                return '6 Number Code Verify is Required';
                              }
                              return null;
                            },
                          ),
                        )
//                      VerificationCode(
//                        textStyle:
//                            TextStyle(fontSize: 20.0, color: Colors.blue),
//                        underlineColor: Colors.blue,
//                        keyboardType: TextInputType.number,
//                        length: 4,
//                        // clearAll is NOT required, you can delete it
//                        // takes any widget, so you can implement your design
//                        clearAll: Padding(
//                          padding: const EdgeInsets.all(8.0),
//                          child: Text(
//                            '',
//                            style: TextStyle(
//                                fontSize: 14.0,
//                                decoration: TextDecoration.underline,
//                                color: Colors.blue[700]),
//                          ),
//                        ),
//                        onCompleted: (String value) {
//                          setState(() {
//                            _code = value;
//                            color = Colors.blue;
//                            smsCode = value;
//                          });
//                        },
//                        onEditing: (bool value) {
//                          setState(() {
//                            _onEditing = value;
//                          });
//                        },
//                      ),
                            ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 20, top: 20),
                          child: Row(
                            children: [
                              TextButton(
                                  onPressed: wait
                                      ? null
                                      : () async {
                                          setState(() {
                                            start = 60;
                                            wait = true;
                                            buttonName = "Resend";
                                          });
                                          await authClass.verifyPhoneNumber(
                                              "+20 ${Usres.phone}",
                                              context,
                                              setData);
                                        },
                                  child: Text(
                                    '$buttonName',
                                    style: TextStyle(color: Colors.grey),
                                  )),
                              Text(
                                'code in 00:00:$start',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: ElevatedButton(
                      onPressed: () {
                        if (FormKey.currentState!.validate()) {
                          if (_code!.length == 6) {
                            print('kajsdhjashdkjashkjdh$verificationIdFinal');
                            authClass.signInwithPhoneNumber(
                                verificationIdFinal, smsCode, context);
                          }
                        }
                      },
                      child: Text(
                        'NEXT',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: color,
                          padding: EdgeInsets.symmetric(vertical: 15))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//  Widget otpField() {
//    return
//    OTPTextField(
//      length: 6,
//      width: MediaQuery.of(context).size.width - 34,
//      fieldWidth: 58,
//      otpFieldStyle: OtpFieldStyle(
//        backgroundColor: Color(0xff1d1d1d),
//        borderColor: Colors.white,
//      ),
//      style: TextStyle(fontSize: 17, color: Colors.white),
//      textFieldAlignment: MainAxisAlignment.spaceAround,
//      fieldStyle: FieldStyle.underline,
//      onCompleted: (pin) {
//        print("Completed: " + pin);
//        setState(() {
//          smsCode = pin;
//        });
//      },
//    );
//  }
  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer _timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  void setData(String verificationId) {
    setState(() {
      verificationIdFinal = verificationId;
    });
  }
}
