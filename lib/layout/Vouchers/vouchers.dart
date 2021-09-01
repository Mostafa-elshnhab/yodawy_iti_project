import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/layout/HomeScreens/Home.dart';

class Vouchers extends StatefulWidget {
  const Vouchers({Key? key}) : super(key: key);

  @override
  _VouchersState createState() => _VouchersState();
}

class _VouchersState extends State<Vouchers> {
  Color mainColor = Colors.black;
  Color starColor = Colors.orange;
  Color? voucherBody = Colors.grey[200];
  Color btnColor = Colors.grey;
  bool? isClicked;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.0),
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
                  'Vouchers',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  'Select voucher to redeem',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 250.0,
                child: Center(
                  child: Container(
                    width: (MediaQuery.of(context).size.width) - 50.0,
                    height: 200.0,
                    color: voucherBody,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          mainColor = Colors.white;
                          starColor = Colors.white;
                          voucherBody = Colors.blue[700];
                          btnColor = Colors.orange;
                        });
                        print('Voucher Clicked');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 10.0,
                                  color: mainColor,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 10.0,
                                  color: mainColor,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 10.0,
                                  color: mainColor,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 10.0,
                                  color: mainColor,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 10.0,
                                  color: mainColor,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 10.0,
                                  color: mainColor,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 10.0,
                                  color: mainColor,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 10.0,
                                  color: mainColor,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 10.0,
                                  color: mainColor,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 10.0,
                                  color: mainColor,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 10.0,
                                  color: mainColor,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: starColor,
                                  size: 35.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'EGP 30',
                                  style: TextStyle(
                                    fontSize: 45.0,
                                    color: mainColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Icon(
                                  Icons.star,
                                  color: starColor,
                                  size: 35.0,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 2.0,
                                      color: mainColor,
                                      width: 30.0,
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Container(
                                      height: 2.0,
                                      color: mainColor,
                                      width: 40.0,
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Container(
                                      height: 2.0,
                                      color: mainColor,
                                      width: 30.0,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  'Voucher',
                                  style: TextStyle(
                                    fontSize: 28.0,
                                    color: mainColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 2.0,
                                      color: mainColor,
                                      width: 30.0,
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Container(
                                      height: 2.0,
                                      color: mainColor,
                                      width: 40.0,
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Container(
                                      height: 2.0,
                                      color: mainColor,
                                      width: 30.0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'This Voucher Expires on',
                              style:
                                  TextStyle(color: mainColor, fontSize: 12.0),
                            ),
                            Text(
                              '1 January 2022',
                              style:
                                  TextStyle(color: mainColor, fontSize: 12.0),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 10.0,
                                  color: mainColor,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 10.0,
                                  color: mainColor,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 10.0,
                                  color: mainColor,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 10.0,
                                  color: mainColor,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 10.0,
                                  color: mainColor,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 10.0,
                                  color: mainColor,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 10.0,
                                  color: mainColor,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 10.0,
                                  color: mainColor,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 10.0,
                                  color: mainColor,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 10.0,
                                  color: mainColor,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 10.0,
                                  color: mainColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 12.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 12.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 21.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 12.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 12.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 12.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 12.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 21.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 12.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 12.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: MaterialButton(
                onPressed: () {
                  if (btnColor == Colors.grey) {
                    return;
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) => Center(
                              child: AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.check_circle_outline_rounded,
                                      color: Colors.green,
                                      size: 60.0,
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      'Success!',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 18.0),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      'Your voucher worth EGP30 will be',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 14.0),
                                    ),
                                    Text(
                                      'redeemed with your next order',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 14.0),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: MaterialButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MyHomePage()));
                                          },
                                          child: Text(
                                            'START ORDERING',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          minWidth: double.infinity,
                                          height: 50,
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ));
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => MyHomePage()));
                  }
                },
                child: Text(
                  'USE VOUCHER',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                minWidth: double.infinity,
                height: 50,
                color: btnColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
