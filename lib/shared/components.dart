import 'package:flutter/material.dart';
import 'package:flutter_app_test/layout/Cart/CartPage.dart';
import 'package:flutter_app_test/layout/Product/Products.dart';
import 'package:flutter_app_test/layout/Search/FisrtSearch.dart';
import 'package:hexcolor/hexcolor.dart';

PreferredSizeWidget appBarBuilder(String appBarTitle, context) {
  return PreferredSize(
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
            centerTitle: true,
            title: Text(
              appBarTitle,
              style: TextStyle(
                fontSize: 20,
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CartPage()));
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
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Search()));
                  },
                  onChanged: (value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Products(2, Text: value)));
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'What Are You Looking for?',
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
  );
}
