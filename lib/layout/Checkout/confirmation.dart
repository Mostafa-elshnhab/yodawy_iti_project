import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_test/Data/Users/userData.dart';
import 'package:flutter_app_test/layout/Cart/CartData.dart';
import 'package:flutter_app_test/layout/Checkout/checkout.dart';
import 'package:flutter_app_test/layout/Checkout/payment.dart';

class Confirmation extends StatefulWidget {
  const Confirmation({Key? key}) : super(key: key);

  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  @override
  Widget build(BuildContext context) {
    double total = 0;
    for (int i = 0; i < Cart.length; i++) {
      total = total + Cart[i]['price'];
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  width: 1,
                  color: Colors.black12,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order #1',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                          size: 22,
                        ),
                        Text(
                          ' Deliviry in 1 hour',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${Cart.length} items',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Delivery Fee',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          ' Up to EGP 10.00',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Total',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          'EGP $total',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Delivery Address',
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Checkout(
                                    ind: 0,
                                  )));
                    });
                  },
                  child: Text(
                    'Change',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  width: 1,
                  color: Colors.black12,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Image.network(
                                'https://www.reviewgeek.com/p/uploads/2020/04/fadc14dd.jpg?width=1200')),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Elgharpia',
                                  style: TextStyle(color: Colors.blue),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'Tanta, salah salem street',
                                  style: TextStyle(),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  '${Usres.phone}',
                                ),
                              ],
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Payment Method',
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Checkout(
                                    ind: 1,
                                  )));
                    });
                  },
                  child: Text(
                    'Change',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  width: 1,
                  color: Colors.black12,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    iscash
                        ? Row(
                            children: [
                              Icon(
                                Icons.money,
                                size: 30.0,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              const Text(
                                'Cash',
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Icon(
                                Icons.credit_card,
                                size: 30.0,
                                color: Colors.blue[600],
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              const Text(
                                'Credit Card Machine',
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
