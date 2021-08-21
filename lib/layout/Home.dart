import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_test/layout/insurance_details.dart';
import 'package:flutter_app_test/models/HomePrandsModel.dart';
import 'package:flutter_app_test/models/insurance_card.dart';
import 'package:flutter_app_test/modules/category/category.dart';
import 'package:flutter_app_test/modules/offers/offers.dart';
import 'package:flutter_app_test/shared/Doctors.dart';
import 'package:flutter_app_test/shared/Drower.dart';
import 'package:flutter_app_test/shared/icon.dart';
import 'package:flutter_app_test/shared/notLoginDrower.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_app_test/models/Doctors_models.dart';
import 'package:image_picker/image_picker.dart';
import 'AllPrandes.dart';
import 'Cart/CartPage.dart';
import 'Insurance.dart';
import 'Medication.dart';
import 'insuranceNotLogin.dart';

int current = 0;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isOffers = false;
  bool isInsure = false;
  bool isLogin = true;
  final List<Widget> Loginpages = [
    home(true),
    Offers(),
    InsuranceScreen(false),
  ];
  final List<Widget> notLoginpages = [
    home(false),
    Offers(),
    InsuranceNotLogin(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: isLogin ? createDrawer(context) : createNotLoginDrawer(context),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: current,
        onTap: (index) {
          setState(() {
            current = index;
            switch (index) {
              case 0:
                isOffers = false;
                isInsure = false;
                break;
              case 1:
                isOffers = true;
                isInsure = false;
                break;
              case 2:
                isOffers = false;
                isInsure = true;
                break;
            }
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_offer_rounded,
              size: 30,
            ),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MyFlutterApp.umbrella,
              size: 30,
            ),
            label: 'Insurance',
          ),
        ],
      ),
      appBar: !isInsure
          ? PreferredSize(
              preferredSize: Size.fromHeight(125.0),
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
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      leadingWidth: 30,
                      centerTitle: isOffers ? true : false,
                      title: !isOffers
                          ? Container(
                              width: 120,
                              height: 30,
                              child: Image.asset('assets/images/logo.png'),
                            )
                          : Text(
                              'Offers',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 27,
                              ),
                            ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: IconButton(
                              icon: Icon(
                                Icons.shopping_cart_rounded,
                                color: HexColor('#22C4EC'),
                                size: 20,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CartPage()));
                              },
                            ),
                            width: 50,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white,
                        ),
                        child: TextField(
                            showCursor: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: isOffers
                                  ? 'Search in Offers'
                                  : 'What Are You Looking for?',
                              hintStyle: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 15,
                              ),
                              prefixIcon: Icon(
                                Icons.search_rounded,
                                color: Colors.grey[400],
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            )
          : null,
      body: isLogin ? Loginpages[current] : notLoginpages[current],
    );
  }
}

class home extends StatefulWidget {
  bool? isLogin;
  home(bool isLoginb) {
    this.isLogin = isLoginb;
  }

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  File? camImage;
  Future pickImage(ImageSource source) async {
    try {
      final camImage = await ImagePicker().pickImage(source: source);
      if (camImage == null) return;

      final ImageTemp = File(camImage.path);
      setState(() {
        this.camImage = ImageTemp;
      });
    } on PlatformException catch (e) {
      print('Failed To Pick An Image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/gift.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.isLogin!
                            ? 'YOU EAENED EGP30'
                            : 'SIGN & GET EGP30',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text('Applies on first order only'),
                      SizedBox(
                        height: 3,
                      ),
                      Text(widget.isLogin! ? 'Min order value EGP 100' : ''),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          widget.isLogin!
                              ? Text(
                                  'Promo Code:',
                                  style: TextStyle(
                                    color: HexColor('#85BAC6'),
                                    fontSize: 18,
                                  ),
                                )
                              : Text(
                                  'SIGN UP',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                          SizedBox(
                            width: 4,
                          ),
                          widget.isLogin!
                              ? Text(
                                  'NEW30',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: HexColor('#2092CA')),
                                )
                              : Icon(
                                  Icons.chevron_right_outlined,
                                  size: 15,
                                  color: Colors.blue,
                                )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Order Medications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Medication()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: new LinearGradient(
                          stops: [0.07, 0.07],
                          colors: [Colors.blue.shade900, Colors.white],
                          end: const Alignment(0.0, 0.6),
                          begin: const Alignment(0.0, -1),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
//                              Icon(Icons.medication,
//                                size: 70,
//                                color: Colors.blue,
//                              ),
                          SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            'assets/images/findx.png',
                            height: 45,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Find',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500
//                                    color: HexColor('#545566')
                                ),
                          ),
                          Text(
                            'Medication',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500
//                                    color: HexColor('#545566')
                                ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 320.0,
                              color: Color(0xFF737373),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20.0),
                                    topLeft: Radius.circular(20.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/prescription.jpg',
                                        width: 130.0,
                                        height: 130.0,
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        'Do you want to use your insurance to upload a prescription?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                border: Border.all(
                                                  color: Colors.orange,
                                                ),
                                              ),
                                              child: MaterialButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              InsuranceScreen(
                                                                  true)));
                                                },
                                                elevation: 0.0,
                                                textColor: Colors.orange,
                                                child: Text(
                                                  'YES',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.orange,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                border: Border.all(
                                                  color: Colors.orange,
                                                ),
                                              ),
                                              child: MaterialButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      context: context,
                                                      builder: (context) {
                                                        return Container(
                                                          color:
                                                              Color(0xFF737373),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        20.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20.0),
                                                              ),
                                                            ),
                                                            child: Wrap(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          20.0),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(10.0),
                                                                        child:
                                                                            Text(
                                                                          'Upload Prescription',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.grey,
                                                                            fontSize:
                                                                                20.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            15.0,
                                                                      ),
                                                                      Container(
                                                                        height:
                                                                            1.0,
                                                                        color: Colors
                                                                            .black12,
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            15.0,
                                                                      ),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          pickImage(
                                                                              ImageSource.camera);
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Icon(
                                                                              Icons.camera_alt,
                                                                              color: Colors.orange,
                                                                              size: 25.0,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 10.0,
                                                                            ),
                                                                            Text(
                                                                              'Camera',
                                                                              style: TextStyle(
                                                                                fontSize: 20.0,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            15.0,
                                                                      ),
                                                                      Container(
                                                                        height:
                                                                            1.0,
                                                                        color: Colors
                                                                            .black12,
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            15.0,
                                                                      ),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          pickImage(
                                                                              ImageSource.gallery);
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Icon(
                                                                              Icons.image,
                                                                              color: Colors.orange,
                                                                              size: 25.0,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 10.0,
                                                                            ),
                                                                            Text(
                                                                              'Gallery',
                                                                              style: TextStyle(
                                                                                fontSize: 20.0,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            30.0,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: Colors.white,
                                                                                borderRadius: BorderRadius.circular(5.0),
                                                                                border: Border.all(
                                                                                  color: Colors.orange,
                                                                                ),
                                                                              ),
                                                                              child: MaterialButton(
                                                                                onPressed: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                elevation: 0.0,
                                                                                textColor: Colors.orange,
                                                                                child: Text(
                                                                                  'CANCEL',
                                                                                  textAlign: TextAlign.center,
                                                                                  style: TextStyle(
                                                                                    fontSize: 18.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                },
                                                elevation: 0.0,
                                                textColor: Colors.white,
                                                child: Text(
                                                  'NO',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: new LinearGradient(
                          stops: [0.07, 0.07],
                          colors: [HexColor('#8C91C1'), Colors.white],
                          end: const Alignment(0.0, 0.6),
                          begin: const Alignment(0.0, -1),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
//                              Icon(Icons.medication,
//                                size: 70,
//                                color: Colors.blue,
//                              ),
                          SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            'assets/images/prescription.png',
                            height: 45,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Upload',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500
//                                    color: HexColor('#545566')
                                ),
                          ),
                          Text(
                            'Prescription',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500
//                                    color: HexColor('#545566')
                                ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Shop by Category',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 10,
            ),
            GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                children: List.generate(choices.length, (index) {
                  return Center(
                    child: CategoryCard(
                      choice: choices[index],
                      index: index,
                    ),
                  );
                })),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text(
                  'Add Insurance Card ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                Expanded(
                  child: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InsuranceScreen(true)));
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 120,
              child: ListView.separated(
                itemBuilder: (context, index) => insuranceCard(
                  insurance: insurance[index],
                  index: index,
                ),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(
                  width: 5,
                ),
                itemCount: insurance.length,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text(
                  'Talk to a Doctor',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                Expanded(
                  child: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Doctors()));
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
              child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 0.0,
                  children: List.generate(doctor.length, (index) {
                    return Center(
                      child: doctorCard(doctor: doctor[index]),
                    );
                  })),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Featured Brands',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                Expanded(
                  child: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllPrands()));
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 0.0,
                childAspectRatio: 1.5,
                children: List.generate(prands.length, (index) {
                  return Center(
                    child: prandsCard(prands: prands[index]),
                  );
                })),
          ],
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.path});
  final String? title;
  final String? path;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Offers', path: 'assets/images/c1.jpg'),
  const Choice(title: 'Covid Essentials', path: 'assets/images/c2.jpg'),
  const Choice(title: 'Baby Care', path: 'assets/images/c3.jpg'),
  const Choice(title: 'Men Care', path: 'assets/images/c4.jpg'),
  const Choice(title: 'Bath & Soap', path: 'assets/images/c5.jpg'),
  const Choice(title: 'Oral Care', path: 'assets/images/c6.jpg'),
  const Choice(title: 'Sexual Wellness', path: 'assets/images/c7.jpg'),
  const Choice(title: 'Supplements', path: 'assets/images/c8.jpg'),
  const Choice(title: 'Personal Care', path: 'assets/images/c9.jpg'),
  const Choice(title: 'Devices', path: 'assets/images/c10.jpg'),
  const Choice(title: 'Women Care', path: 'assets/images/c11.jpg'),
  const Choice(title: 'Makeup', path: 'assets/images/c12.jpg'),
  const Choice(title: 'Skin Care', path: 'assets/images/c13.jpg'),
  const Choice(title: 'Hair Care', path: 'assets/images/c14.jpg'),
  const Choice(title: 'Maternity Care', path: 'assets/images/c15.jpg'),
];

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, this.choice, this.index}) : super(key: key);
  final Choice? choice;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  print('hamada');
                  if (index == 0) {
                    current = 1;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Category(choice!.title)));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          '${choice!.path}',
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
              ),
            ),
            Text(
              '${choice!.title}',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ]),
    ));
  }
}

class Insurance {
  const Insurance({this.title, this.path});
  final String? title;
  final String? path;
}

const List<Insurance> insurance = const <Insurance>[
  const Insurance(title: 'MetLife', path: 'assets/images/metlife.png'),
  const Insurance(title: 'AXA', path: 'assets/images/axa.jpg'),
  const Insurance(title: 'Nextcare', path: 'assets/images/next.png'),
  const Insurance(title: 'MedNet', path: 'assets/images/mednet.png'),
  const Insurance(title: 'Unicare', path: 'assets/images/Unicare.png'),
  const Insurance(title: 'Roche', path: 'assets/images/roche.png'),
  const Insurance(title: 'MediConsult', path: 'assets/images/mediconsult.png'),
  const Insurance(title: 'AMC', path: 'assets/images/amc.jpeg'),
];

class insuranceCard extends StatelessWidget {
  const insuranceCard({Key? key, this.insurance, required this.index})
      : super(key: key);
  final Insurance? insurance;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 100,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InsuranceDetails(
                                card: card[index].cardDetailsModel,
                              )),
                    );
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          '${insurance!.path}',
                          width: 90,
                          height: 20,
                        ),
                      )),
                ),
              ),
              Divider(
//              color: Colors.grey,
                height: 0,
                thickness: 1,
                endIndent: 5,
                indent: 5,
              ),
              Container(
                height: 40,
                padding: EdgeInsetsDirectional.only(top: 10),
                child: Container(
                  child: Text(
                    '${insurance!.title}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}

const List<Doctor> doctor = const <Doctor>[
  const Doctor(
      title: 'COVID-19', path: 'assets/images/covid.png', color: '#06428b'),
  const Doctor(
      title: 'Stomack',
      path: 'assets/images/stomachache.png',
      color: '#43b7ac'),
  const Doctor(
      title: 'Fever', path: 'assets/images/fever.png', color: '#e65b60'),
  const Doctor(
      title: 'Diarrhea', path: 'assets/images/diarrhea.png', color: '#8d93c3'),
  const Doctor(
      title: 'Sinus', path: 'assets/images/sinus.png', color: '#88214c'),
  const Doctor(
      title: 'Migraines', path: 'assets/images/headache.png', color: '#71d1fb'),
];

class doctorCard extends StatelessWidget {
  const doctorCard({Key? key, this.doctor}) : super(key: key);
  final Doctor? doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: GestureDetector(
              onTap: () {
//                          setState(() {
//                            ismale=true;
//                          });
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: new LinearGradient(
                    stops: [0.07, 0.07],
                    colors: [HexColor('${doctor!.color}'), Colors.white],
                    end: const Alignment(0.0, 0.6),
                    begin: const Alignment(0.0, -1),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
//                              Icon(Icons.medication,
//                                size: 70,
//                                color: Colors.blue,
//                              ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      '${doctor!.path}',
                      height: 35,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${doctor!.title}',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500
//                                    color: HexColor('#545566')
                          ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

////////////////////////////////

const List<Prands> prands = const <Prands>[
  const Prands(path: 'assets/images/laroch.png'),
  const Prands(path: 'assets/images/Vichy.png'),
  const Prands(path: 'assets/images/loreal.png'),
  const Prands(path: 'assets/images/axe.png'),
  const Prands(path: 'assets/images/garnierpng.png'),
  const Prands(path: 'assets/images/always.png'),
  const Prands(path: 'assets/images/bioderma.png'),
  const Prands(path: 'assets/images/johns.png'),
  const Prands(path: 'assets/images/lux.png'),
];

class prandsCard extends StatelessWidget {
  const prandsCard({Key? key, this.prands}) : super(key: key);
  final Prands? prands;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            child: Image.asset(
              '${prands!.path}',
              width: 40,
            ),
          ),
        ),
      ),
    );
  }
}
