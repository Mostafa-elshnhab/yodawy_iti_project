import 'package:flutter/material.dart';
import 'package:flutter_app_test/layout/Cart/CartData.dart';
import 'package:flutter_app_test/layout/Product/Products.dart';
import 'package:flutter_app_test/models/toppicksmodel.dart';
import 'package:flutter_app_test/modules/offers/components/toppicks.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../layout/Cart/CartPage.dart';

class AllTopPicks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
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
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leadingWidth: 30,
              centerTitle: true,
              title: Text(
                'Yodawy Top Picks',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartPage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Row(
                        children: [
                          Expanded(
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
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          (Cart.length != 0)
                              ? Expanded(
                            child: Text(
                              '${Cart.length}',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                              ),
                            ),
                          )
                              : SizedBox(),
                        ],
                      ),
                      width: (Cart.length != 0) ? 60 : 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 0.0,
                    childAspectRatio: 1.5,
                    children: List.generate(topPick.length, (index) {
                      return TopPicks(
                          topPicks: topPick[index],
                          press: () {
                            print('${topPick[index].productName}');
//                            Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) => Products(
//                                          Text: '${topPick[index].productName}',
//                                        )));
                          });
                    })),
              ],
            ),
          ),
        ));
  }
}
