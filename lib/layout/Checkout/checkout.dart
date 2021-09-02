import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/layout/Checkout/address.dart';
import 'package:flutter_app_test/layout/Checkout/confirmation.dart';
import 'package:flutter_app_test/layout/Checkout/payment.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {


  List<String> checkoutLevels = [
    'Address',
    'Payment',
    'Confirmation',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                    'Confirm Your Address',
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Please add a delivery address',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
                TabBar(
                    indicatorColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 4.0,
                    labelStyle: TextStyle(
                        fontSize: 16.0,
                        ),
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
        body: TabBarView(
            children: [
          Address(),
          Payment(),
          Confirmation(),
        ]),
      ),
    );
  }
}
