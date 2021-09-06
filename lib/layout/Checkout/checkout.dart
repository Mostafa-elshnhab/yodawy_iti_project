import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/layout/Cart/CartData.dart';
import 'package:flutter_app_test/layout/Checkout/address.dart';
import 'package:flutter_app_test/layout/Checkout/confirmation.dart';
import 'package:flutter_app_test/layout/Checkout/payment.dart';
import 'package:flutter_app_test/layout/HomeScreens/Home.dart';
import 'package:flutter_app_test/layout/MyOrders/MyOrdersData.dart';

int indedx = 0;

class Checkout extends StatefulWidget {
  final int? ind;
  Checkout({this.ind}) {
    indedx = this.ind!;
  }

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout>
    with SingleTickerProviderStateMixin {
  List<String> checkoutLevels = [
    'Address',
    'Payment',
    'Confirmation',
  ];
  bool isAddresConferm = false;
  bool ispayConferm = false;
  final List<Widget> tapPages = [
    Address(),
    Payment(),
    Confirmation(),
  ];

  TabController? _tabController;
  final List<String> titles = [
    'Confirm Your Address',
    'Select Payment Method',
    'Review Your Order'
  ];
  final List<String> subTitles = [
    'Your last used address is always pre-selected',
    'Your last used Payment is always pre-selected',
    'Please review your order'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
        length: tapPages.length, vsync: this, initialIndex: indedx);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> buttons = [
      TextButton(
        child: Text(
          'CONFIRM ADDRESS',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () {
          setState(() {
            _tabController!.animateTo(1);
            isAddresConferm = true;
          });
        },
      ),
      TextButton(
        child: Text(
          'CONFIRM PAYMENT METHOD',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () {
          setState(() {
            _tabController!.animateTo(2);
            ispayConferm = true;
          });
        },
      ),
      TextButton(
        child: Text(
          'PLACE ORDER',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () {
          setState(() {
            for (int i = 0; i < Cart.length; i++) {
              MyOrdes.add(Cart[i]);
            }
            saveMyOrdesData();
            Cart.clear();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyHomePage()));
          });
        },
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(153.0),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: Text(''),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  titles[_tabController!.index],
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  subTitles[_tabController!.index],
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
//                Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Row(
//                    children: [
//                      Expanded(
//                          child: GestureDetector(
//                        onTap: () {
//                          setState(() {
//                            isConfermed = true;
//                          });
//                        },
//                        child: Container(
//                          padding: EdgeInsetsDirectional.all(5),
//                          decoration: BoxDecoration(
//                            color: Colors.white,
//                            borderRadius: BorderRadius.circular(20),
//                          ),
//                          child: Center(child: Text('Address')),
//                        ),
//                      )),
//                      SizedBox(
//                        width: 4,
//                      ),
//                      isConfermed
//                          ? Expanded(
//                              child: GestureDetector(
//                              onTap: () {
//                                setState(() {
//                                  curunt = 1;
//                                });
//                              },
//                              child: Container(
//                                padding: EdgeInsetsDirectional.all(5),
//                                decoration: BoxDecoration(
//                                  color: Colors.white,
//                                  borderRadius: BorderRadius.circular(20),
//                                ),
//                                child: Center(child: Text('Payment')),
//                              ),
//                            ))
//                          : Expanded(child: Center(child: Text('Payment'))),
//                      SizedBox(
//                        width: 4,
//                      ),
//                      Expanded(
//                          child: GestureDetector(
//                        onTap: () {},
//                        child: Container(
//                          padding: EdgeInsetsDirectional.all(5),
//                          decoration: BoxDecoration(
//                            color: Colors.white,
//                            borderRadius: BorderRadius.circular(20),
//                          ),
//                          child: Center(child: Text('Confirmation')),
//                        ),
//                      )),
//                    ],
//                  ),
//                )

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonsTabBar(
//                    indicatorColor: Colors.white,
//                    indicatorSize: TabBarIndicatorSize.tab,
//                    indicatorWeight: 4.0,
                    height: 23,
                    radius: 10,
                    controller: _tabController,
                    onTap: (index) {
                      setState(() {
                        print('addd $isAddresConferm');
                        print('paayyy $ispayConferm');
                        print(index);
                        if (index == 2 && isAddresConferm && ispayConferm) {
                          _tabController!.index = 2;
                          print(_tabController!.index);
                        } else if (index == 1 && isAddresConferm) {
                          _tabController!.index = 1;
                        } else {
                          _tabController!.index = 0;
                        }
                      });
                    },
                    contentPadding: EdgeInsets.symmetric(horizontal: 5),
                    buttonMargin: EdgeInsets.symmetric(horizontal: 20),
                    backgroundColor: Colors.white,
                    unselectedBackgroundColor: Colors.transparent,
                    unselectedLabelStyle: TextStyle(color: Colors.white54),
                    labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                    tabs: [
                      Tab(
                        text: "Address",
                      ),
                      Tab(
                        text: "Payment",
                      ),
                      Tab(
                        text: "Confirmation",
                      ),
                    ]),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       Container(
              //         padding: EdgeInsets.symmetric(vertical: 5.0 , horizontal: 25.0),
              //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(40.0) , color: Colors.blue[700]),
              //         child: Center(child: Text('Address' , style: TextStyle(color: Colors.white),),),
              //       ),
              //       Container(
              //         child: Center(child: Text('Payment' , style: TextStyle(color: Colors.white),),),
              //       ),
              //       Container(
              //         child: Center(child: Text('Confirmation' , style: TextStyle(color: Colors.white),),),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: tapPages[_tabController!.index]),
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.orange,
            ),
            child: buttons[_tabController!.index],
          ),
        ],
      ),
//        TabBarView(children: [tapPages[0], tapPages[1], tapPages[2]]),
    );
  }
}
