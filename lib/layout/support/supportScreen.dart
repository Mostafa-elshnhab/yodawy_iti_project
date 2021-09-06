import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/layout/support/FAQ.dart';
import 'package:flutter_app_test/layout/support/howCan.dart';
import 'package:flutter_app_test/layout/support/myorder.dart';

class SupportScreen extends StatelessWidget {
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
                      'Support',
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
        child: Container(
          child: Column(
            children: [
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    child: Card(
                      elevation: 3,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(17),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: <Color>[
                                      Color(0xFF179FDB),
                                      Color(0xFF179FDB),
                                      Color(0xFF21B3E4),
                                      Color(0xFF2ECBEE),
                                    ]),
                              ),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.transparent,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Icon(
                                      Icons.shopping_bag_outlined,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 7),
                                        child: Icon(Icons.check,
                                            size: 12, color: Colors.white)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Need help with an order',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.orange,
                                  size: 20,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyOrderScreen()),
                  );
                },
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    child: Card(
                      elevation: 3,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(17),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: <Color>[
                                      Color(0xFF179FDB),
                                      Color(0xFF179FDB),
                                      Color(0xFF21B3E4),
                                      Color(0xFF2ECBEE),
                                    ]),
                              ),
                              child: CircleAvatar(
                                radius: 21,
                                backgroundColor: Colors.transparent,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                        child: Image(
                                      width: 180,
                                      height: 180,
                                      image: NetworkImage(
                                          'https://images-na.ssl-images-amazon.com/images/I/21M0l6AEgaL.png'),
                                    ))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Need help with an app',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.orange,
                                  size: 20,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HowCanScreen()),
                  );
                },
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FaqScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    child: Card(
                      elevation: 3,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(17),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: <Color>[
                                      Color(0xFF179FDB),
                                      Color(0xFF179FDB),
                                      Color(0xFF21B3E4),
                                      Color(0xFF2ECBEE),
                                    ]),
                              ),
                              child: CircleAvatar(
                                radius: 21,
                                backgroundColor: Colors.transparent,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                        child: Image(
                                      width: 180,
                                      height: 180,
                                      image: NetworkImage(
                                          'https://images-na.ssl-images-amazon.com/images/I/21M0l6AEgaL.png'),
                                    ))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Frequently asked questions',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.orange,
                                  size: 20,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
