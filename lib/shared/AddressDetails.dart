import 'package:flutter/material.dart';
import 'package:flutter_app_test/layout/Checkout/checkout.dart';
import 'package:flutter_app_test/layout/settings/location1.dart';

List<String> AddressData = [];
int? number;

class AdressDetails extends StatefulWidget {
  int? pagenum;
  AdressDetails(this.pagenum) {
    number = this.pagenum;
  }
  @override
  _AdressDetailsState createState() => _AdressDetailsState();
}

class _AdressDetailsState extends State<AdressDetails> {
  Color buttonColor = Colors.grey;
  String buttonText = 'Please file all fields';
  TextEditingController strretController = TextEditingController();
  TextEditingController buildController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController apartController = TextEditingController();
  TextEditingController nearestController = TextEditingController();
  TextEditingController nickController = TextEditingController();
  int Counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color(0xFF179FDB),
                  Color(0xFF179FDB),
                  Color(0xFF21B3E4),
                  Color(0xFF2ECBEE),
                ],
                tileMode: TileMode.clamp,
              ),
            ),
            child: Column(
              children: [
                AppBar(
                  toolbarHeight: 50,
                  // automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leadingWidth: 15,
                  leading: GestureDetector(
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  title: Container(
                      // width: double.infinity ,
                      child: Column(
                    children: [
                      Center(
                          child: Text(
                        'Address Details',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ],
                  )),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/Locationde.jpeg'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Address type',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextField(
                  style: TextStyle(
                      fontSize: 17, height: 1.2, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    hintText: 'Apartment',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(27, 159, 201, 1),
                    ),
                  ),
                  readOnly: true,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'City',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextFormField(
                  style: TextStyle(
                      fontSize: 17, height: 1.2, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    hintText: 'Tanta',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(27, 159, 201, 1),
                    ),
                  ),
                  readOnly: true,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Street',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextField(
                  controller: strretController,
                  style: TextStyle(
                      color: Color.fromRGBO(27, 159, 201, 1),
                      fontSize: 18,
                      height: 1.2,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    hintText: 'Add street name',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      Counter = 1;
                    });
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Building',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextField(
                  controller: buildController,
                  style: TextStyle(
                      color: Color.fromRGBO(27, 159, 201, 1),
                      fontSize: 18,
                      height: 1.2,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    hintText: 'Add building number',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      Counter = 2;
                    });
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Floor',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        TextFormField(
                          controller: floorController,
                          style: TextStyle(
                              color: Color.fromRGBO(27, 159, 201, 1),
                              fontSize: 18,
                              height: 1.2,
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            hintText: 'Add floor number',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              Counter = 3;
                            });
                          },
                        ),
                      ],
                    )),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Apartment',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        TextFormField(
                          controller: apartController,
                          style: TextStyle(
                              color: Color.fromRGBO(27, 159, 201, 1),
                              fontSize: 18,
                              height: 1.2,
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            hintText: 'Add apartment number',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              Counter = 4;
                            });
                          },
                        ),
                      ],
                    )),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Nrearst Landmark',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextFormField(
                  controller: nearestController,
                  style: TextStyle(
                      color: Color.fromRGBO(27, 159, 201, 1),
                      fontSize: 18,
                      height: 1.2,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    hintText: 'Add bank name, supermarket,hospital...  ',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      Counter = 5;
                    });
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Nickname',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextFormField(
                  controller: nickController,
                  style: TextStyle(
                      color: Color.fromRGBO(27, 159, 201, 1),
                      fontSize: 18,
                      height: 1.2,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    hintText: 'Home,Office,etc',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  onChanged: (va) {
                    if (Counter == 5) {
                      setState(() {
                        buttonColor = Colors.orange;
                        buttonText = 'save address';
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      height: 50,
                      minWidth: double.infinity,
                      onPressed: () {
                        setState(() {
                          if (Counter == 5) {
                            AddressData.add(nickController.text);
                            AddressData.add(strretController.text);
                            AddressData.add(buildController.text);
                            AddressData.add(floorController.text);
                            AddressData.add(apartController.text);
                            AddressData.add(nearestController.text);
                            (number == 0)
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Location1()))
                                : Navigator.pop(context);
                            print('sadasdas');
                          }
                        });
                      },
                      child: Text(
                        buttonText.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: buttonColor,
                    )),
              ],
            ),
          ),
        ));
  }
}
