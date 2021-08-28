import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/Data/Users/userData.dart';
import 'splashScreen.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var controlphone = TextEditingController();
  var countNum = 0;
  var bgColor = Colors.grey;
  var layer = Colors.white;
  final FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: layer,
      body: Container(
        // color: layer,
        child: SafeArea(
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
                            onPressed: () {
                              setState(() {
                                layer = Colors.white;
                              });

                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios_rounded)),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            // top: 20,
                            left: 10),
                        child: Text(
                          'To register or log in ,'
                          'please enter your mobile number ',
                          style: TextStyle(fontSize: 22, height: 1.5),
                        ),
                      ),
                      Container(
                        // color: Colors.blue,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                              width: 120,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: Colors.black26))),
                              child: CountryListPick(
                                appBar: AppBar(
                                  title: Text("Select Your Country"),
                                ),
                                initialSelection: '+20',
                                theme: CountryTheme(
                                  isShowFlag: true,
                                  isShowTitle: false,
                                  isShowCode: true,
                                  isDownIcon: true,
                                  showEnglishName: true,
                                  labelColor: Colors.blueAccent,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 170,
                              child: TextFormField(
                                style: TextStyle(
                                    color: Color.fromRGBO(27, 159, 201, 1),
                                    fontSize: 20,
                                    height: 1.2,
                                    fontWeight: FontWeight.w500),
                                controller: controlphone,
                                keyboardType: TextInputType.number,
                                cursorColor: Color.fromRGBO(27, 159, 201, 1),
                                cursorHeight: 38,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Phone Number is Required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Phone Number',
                                  hintStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black26,
                                    fontWeight: FontWeight.w500,
                                    decorationThickness: 2,
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    countNum = value.length;
                                    if (countNum == 10) {
                                      bgColor = Colors.blue;
                                    } else {
                                      bgColor = Colors.grey;
                                    }

                                    print(countNum);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                        child: Text('By continuing , you agree to our',
                            style:
                                TextStyle(fontSize: 11, color: Colors.black54)),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Terms & Conditions and Privacy Policy',
                            style: TextStyle(
                                color: Color.fromRGBO(27, 159, 201, 1),
                                fontWeight: FontWeight.w200,
                                fontSize: 12),
                          )),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: ElevatedButton(
                            onPressed: () async {
                              if (FormKey.currentState!.validate()) {
                                setState(() {
                                  if (countNum == 10) {
                                    layer = Colors.grey.withOpacity(.8);
                                    Usres.phone = "${controlphone.text}";
                                  }
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SplashScreen()),
                                );
                              }
                            },
                            child: Text(
                              'NEXT',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: bgColor,
                                padding: EdgeInsets.symmetric(vertical: 15))),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),

                /*  IntlPhoneField(
                        decoration: InputDecoration(
                          hintText : 'Phone Number',
                        ),
                        initialCountryCode: 'NP',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      )*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
