import 'package:flutter/material.dart';
import 'package:flutter_app_test/Data/Users/userData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'genderScreen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Future<Null> loginUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', "${Usres.name}");
    prefs.setString('address', "${Usres.address}");
    prefs.setString('phone', "${Usres.phone}");
    prefs.setString('gender', "${Usres.gender}");
    prefs.setStringList('usredata', userdata!);
    setState(() {
      isLoggedIn = true;
    });
  }

  var fname = TextEditingController();

  var lname = TextEditingController();
  var btnColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    userdata = Usres.getDAta();
    if (fname.value.text == null && lname.value.text == null) {
      btnColor = Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Expanded(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to Yodawy',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Continue the sign-up by',
                          style: TextStyle(fontSize: 22),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'entering your name',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  //width:130,
                                  child: TextFormField(
                                    controller: fname,
                                    style: TextStyle(
                                        color: Color.fromRGBO(27, 159, 201, 1),
                                        fontSize: 20,
                                        height: 1.2,
                                        fontWeight: FontWeight.w500),
                                    decoration: InputDecoration(
                                      hintText: 'First Name',
                                      hintStyle: TextStyle(
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  // width: 140,
                                  child: TextFormField(
                                    controller: lname,
                                    style: TextStyle(
                                        color: Color.fromRGBO(27, 159, 201, 1),
                                        fontSize: 20,
                                        height: 1.2,
                                        fontWeight: FontWeight.w500),
                                    decoration: InputDecoration(
                                        hintText: 'Last Name',
                                        hintStyle: TextStyle(
                                          color: Colors.grey[400],
                                        )),
                                    onChanged: (value) {
                                      setState(() {
                                        if (fname.value.text != null &&
                                            lname.value.text != null) {
                                          btnColor = Colors.blue;
                                        } else {
                                          btnColor = Colors.grey;
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 15, right: 15, top: 240),
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            String name =
                                fname.value.text + ' ' + lname.value.text;
                            Usres.name = name;
                          });
                          loginUser();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GenderScreen()),
                          );
                        },
                        child: Text(
                          'NEXT',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: btnColor,
                            padding: EdgeInsets.symmetric(vertical: 15))),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
