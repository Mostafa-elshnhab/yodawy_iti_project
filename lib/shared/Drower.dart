import 'package:flutter/material.dart';
import 'package:flutter_app_test/layout/FavoriteItems/FavPage.dart';
import 'package:flutter_app_test/layout/settings/settings.dart';
import 'package:flutter_app_test/layout/support/supportScreen.dart';
import 'package:hexcolor/hexcolor.dart';

Widget createDrawer(context) => Drawer(
      child: Container(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              child: const DrawerHeader(
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
                child: Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Text(
                    'Mostafa Elshnhab',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      //fontWeight: FontWeight.bold,
//                    fontFamily: 'Tajawal',
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
//         shrinkWrap: true,
//              itemExtent:40,
//              // Important: Remove any padding from the ListView.
//              padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    horizontalTitleGap: 0,
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Icon(
                      Icons.replay,
                      size: 25,
                      color: HexColor('#EEAF41'),
                    ),
                    title: const Text(
                      'Buy Again',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    horizontalTitleGap: 0,
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Icon(
                      Icons.star_border,
                      size: 25,
                      color: HexColor('#EEAF41'),
                    ),
                    title: const Text(
                      'Starred Items',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FavPage()));
                    },
                  ),
                  ListTile(
                    horizontalTitleGap: 0,
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Icon(
                      Icons.assignment_outlined,
                      size: 25,
                      color: HexColor('#EEAF41'),
                    ),
                    title: const Text(
                      'e-Prescription',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    horizontalTitleGap: 0,
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Icon(
                      Icons.shopping_basket_outlined,
                      size: 25,
                      color: HexColor('#EEAF41'),
                    ),
                    title: const Text(
                      'My Orders',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
//              color: Colors.grey,
                    height: 0,
                    thickness: 1,
                    endIndent: 15,
                    indent: 15,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    horizontalTitleGap: 0,
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Icon(
                      Icons.assignment_outlined,
                      size: 25,
                      color: HexColor('#EEAF41'),
                    ),
                    title: const Text(
                      'My Vouchers',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    horizontalTitleGap: 0,
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Icon(
                      Icons.wallet_giftcard_rounded,
                      size: 25,
                      color: HexColor('#EEAF41'),
                    ),
                    title: const Text(
                      'Share & Earn',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
//              color: Colors.grey,
                    thickness: 1,
                    endIndent: 15,
                    indent: 15,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    horizontalTitleGap: 0,
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Icon(
                      Icons.person,
                      size: 25,
                      color: HexColor('#EEAF41'),
                    ),
                    title: const Text(
                      'Account Settings',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      // Settings
                      // ...
                      // Then close the drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Settings()),
                      );
                    },
                  ),
                  ListTile(
                    horizontalTitleGap: 0,
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Icon(
                      Icons.chat_rounded,
                      size: 25,
                      color: HexColor('#EEAF41'),
                    ),
                    title: const Text(
                      'Support',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
//                fontWeight: FontWeight.bold
                      ),
                    ),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      // Navigator.pop(context);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SupportScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              alignment: AlignmentDirectional.bottomStart,
              margin: EdgeInsetsDirectional.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text('Proudly Developed in Egypt'),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                            width: 23,
                            height: 15,
                            child: Image.asset('assets/images/egypt.png')),
                      ],
                    ),
                  ),
                  Text('v2.2.1')
                ],
              ),
            )
          ],
        ),
      ),
    );
