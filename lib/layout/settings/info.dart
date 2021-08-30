import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_test/Data/Users/userData.dart';
import 'package:intl/intl.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({Key? key}) : super(key: key);

  @override
  _AccountInfoState createState() => _AccountInfoState();
}

enum SingingCharacter { Male, Female }

class _AccountInfoState extends State<AccountInfo> {
  SingingCharacter? _character = SingingCharacter.Female;
  int val = -1;
  bool _value = false;
  DateTime bDate = DateTime.utc(1996, 12, 1);
  /*DateTime now = DateTime.now();
  String formattedDate = DateFormat('yyyy-MMMM-dd ').format(now);*/
  var name2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Account Info'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              child('Mobile Number', Icons.phone, '+20 ${Usres.phone}', 1),
              separate(),
              child('Name', Icons.edit, "${Usres.name}", 2),
              separate(),
              child(
                  'Gender ', Icons.transgender_outlined, "${Usres.gender}", 3),
              separate(),
              child(
                  'Birthdate',
                  Icons.calendar_today_outlined,
                  bDate.year.toString() +
                      '-' +
                      bDate.month.toString() +
                      '-' +
                      bDate.day.toString(),
                  0),
            ],
          ),
        ));
  }

  Widget child(String txt, IconData icon, String phone, x) {
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  txt,
                  style: TextStyle(
                    fontSize: 20,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  phone,
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ),
      onTap: () {
        if (x == 1) print('hi');
        if (x == 2) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  backgroundColor: Colors.white,
                  title: Center(
                      child: Text(
                    "Your Name",
                  )),
                  content: TextFormField(
                    controller: name2,
                    decoration: InputDecoration(
                      hintText: '${Usres.name}',
                    ),
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
                                setState(() {
                                  Usres.name = name2.text;
                                });
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: const Text('Female'),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.Female,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                              print(_character);
                              //gender='Female';
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Male'),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.Male,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                              //   gender='Male';
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
                                if (_character == SingingCharacter.Female) {
                                  setState(() {
                                    Usres.gender = 'Female';
                                  });
                                } else {
                                  setState(() {
                                    Usres.gender = "Male";
                                  });
                                }
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
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  child: CupertinoDatePicker(
                    onDateTimeChanged: (DateTime value) {
                      print(value);
                      setState(() {
                        bDate = value;
                      });
                    },
                    initialDateTime: bDate,
                    minimumYear: 1900,
                    maximumYear: 2030,
                    mode: CupertinoDatePickerMode.date,
                  ),
                );
              });
        }
      },
    );
  }

  Widget separate() {
    return Container(
      height: 0.5,
      width: MediaQuery.of(context).size.width - 30,
      color: Colors.grey,
    );
  }
}
