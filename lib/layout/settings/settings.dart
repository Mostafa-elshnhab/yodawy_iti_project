import 'package:flutter/material.dart';
import 'package:flutter_app_test/Data/Users/userData.dart';
import 'package:flutter_app_test/layout/settings/info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../StartSlider.dart';
import 'location1.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

enum SingingCharacter { Male, Female }

class _SettingsState extends State<Settings> {
  Future<Null> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoggedIn = false;
      prefs.setString('phone', '');
      print('sasa$isLoggedIn');
    });
  }

  //int x=0;
  SingingCharacter? _character = SingingCharacter.Female;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${Usres.name}",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              Text(
                "+20 ${Usres.phone}",
                style: TextStyle(color: Colors.white, fontSize: 14.0),
              ),
            ]),
      ),
      body: Column(
        children: [
          child('Address', Icons.location_on_outlined, 1),
          separate(),
          child('Account Info', Icons.view_list_outlined, 2),
          separate(),
          child('App Language ', Icons.vpn_lock_outlined, 3),
          separate(),
          child('Log out', Icons.logout_rounded, 0),
        ],
      ),
    );
  }

  Widget child(String txt, IconData icon, x) {
    return GestureDetector(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              //  SizedBox(width: 10,),
              Icon(
                icon,
                color: Color.fromRGBO(255, 154, 0, 1),
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                txt,
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
        onTap: () {
          if (x == 1)
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Location1()));
          if (x == 2)
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AccountInfo()));
          if (x == 3) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    backgroundColor: Colors.white,
                    title: Center(
                        child: Text(
                      "Your Gender",
                    )),
                    content: Column(
                      children: [
                        ListTile(
                          title: const Text('English'),
                          leading: Radio<SingingCharacter>(
                            value: SingingCharacter.Female,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                                //gender='Female';
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('العربية'),
                          leading: Radio<SingingCharacter>(
                            value: SingingCharacter.Male,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                                //gender='Male';
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 154, 0, 1),
                                  borderRadius: BorderRadius.circular(5)),
                              width: MediaQuery.of(context).size.width,
                              child: TextButton(
                                child: Text(
                                  "CONFIRM",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )),
                          TextButton(
                            child: Text(
                              "CANCEL",
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 154, 0, 1),
                                  fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      )
                    ]);
              },
            );
          }
          if (x == 0) {
            logout();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StartSlider()));
          }
        });
  }

  Widget separate() {
    return Container(
      height: 0.5,
      width: MediaQuery.of(context).size.width - 30,
      color: Colors.grey,
    );
  }
}
