import 'package:flutter/material.dart';
import 'package:flutter_app_test/Data/Users/userData.dart';
import 'package:flutter_app_test/layout/Cart/CartPage.dart';
import 'package:hexcolor/hexcolor.dart';

Widget TotalContainer(context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CartPage()));
    },
    child: Container(
      height: 50,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: HexColor('#FF9D46'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 20),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                width: 25,
                height: 30,
                child: Center(
                  child: Text(
                    '$total',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  child: Center(
                    child: Text(
                      'VIEW CART',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'EGP $totalPrice',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ],
        ),
      ),
    ),
  );
}
