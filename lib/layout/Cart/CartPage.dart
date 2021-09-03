import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_test/Data/Users/userData.dart';
import 'package:flutter_app_test/layout/Checkout/checkout.dart';
import 'package:flutter_app_test/layout/FavoriteItems/FavData.dart';
import 'package:flutter_app_test/layout/Product/pandoalData.dart';
import 'package:flutter_app_test/layout/Product/Products.dart';
import 'package:flutter_app_test/notification/notificationservice.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:math' as math;

import '../HomeScreens/Home.dart';
import 'CartData.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isempty = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (Cart.length == 0) {
      isempty = false;
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(115.0),
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
//                actions: [
//                  Padding(
//                    padding: const EdgeInsets.all(10.0),
//                    child: Container(
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(20),
//                          color: Colors.white),
//                      child: IconButton(
//                        icon: Icon(
//                          Icons.shopping_cart_rounded,
//                          color: HexColor('#22C4EC'),
//                          size: 20,
//                        ),
//                        onPressed: () {},
//                      ),
//                      width: 50,
//                    ),
//                  )
//                ],
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Your Cart',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
      body: !isempty
          ? Column(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart_rounded,
                          size: 160,
                          color: Colors.blue,
                        ),
                        Text(
                          'Your Cart is empty!',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Explore Yodawy and start shopping now',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                      },
                      child: Text(
                        'EXPLORE YODAWY',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      minWidth: double.infinity,
                      height: 50,
                      color: HexColor('#FF9D46'),
                    ),
                  ),
                ),
              ],
            )
          : Padding(
              padding: EdgeInsetsDirectional.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: Colors.blue,
                        size: 24,
                      ),
                      Text(
                        ' Deliviry within 1 hour',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Expanded(
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => ListTile(
                              selected: true,
                              title: GestureDetector(
                                onTap: () {
                                  int? pointer;
                                  for (int i = 0; i <= pro.length; i++) {
                                    if (Cart[index]['_id'] == pro[i]['_id']) {
                                      pointer = i;
                                    }
                                  }
//                                  Navigator.push(
//                                      context,
//                                      MaterialPageRoute(
//                                          builder: (context) =>
//                                              ProductDetalis(pointer!)));
                                },
                                child: Container(
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 120,
                                          width: 150,
                                          child: Stack(
                                            children: [
                                              Container(
                                                alignment:
                                                    AlignmentDirectional.center,
                                                child: Image.network(
                                                  '${Cart[index]['path']}',
                                                  height: 90,
                                                  width: 80,
                                                ),
                                              ),
                                              Cart[index]['nostok']
                                                  ? Text('')
                                                  : Transform.rotate(
                                                      angle: -math.pi / 4,
                                                      child: Container(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: Container(
                                                            alignment:
                                                                AlignmentDirectional
                                                                    .center,
                                                            height: 20,
//                                        width: 95,
                                                            color: Cart[index]
                                                                    ['stock']
                                                                ? HexColor(
                                                                    '#FE4646')
                                                                : HexColor(
                                                                    '#9D9D9D'),
                                                            child: Text(
                                                              Cart[index]
                                                                      ['stock']
                                                                  ? 'Low Stock'
                                                                  : 'Out of Stock',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 12),
                                                            ),
                                                          )),
                                                    ),
//
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
//                                mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    '${(Cart[index]['name']).toUpperCase()}',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                      height: 30,
                                                      alignment:
                                                          AlignmentDirectional
                                                              .topEnd,
                                                      child: !(Cart[index]
                                                              ['selected'])
                                                          ? IconButton(
                                                              icon: Icon(
                                                                Icons
                                                                    .star_border_outlined,
                                                                size: 30,
                                                                color: HexColor(
                                                                    '#EEAF41'),
                                                              ),
                                                              onPressed: () {
                                                                setState(() {
                                                                  Cart[index][
                                                                      'selected'] = !Cart[
                                                                          index]
                                                                      [
                                                                      'selected'];
                                                                  Fav.add(Cart[
                                                                      index]);
                                                                  saveFavtData();
                                                                });
                                                              },
                                                            )
                                                          : IconButton(
                                                              icon: Icon(
                                                                Icons.star,
                                                                size: 30,
                                                                color: HexColor(
                                                                    '#EEAF41'),
                                                              ),
                                                              onPressed: () {
                                                                setState(() {
                                                                  Cart[index][
                                                                      'selected'] = !Cart[
                                                                          index]
                                                                      [
                                                                      'selected'];
                                                                  for (int i =
                                                                          0;
                                                                      i <=
                                                                          Fav.length;
                                                                      i++) {
                                                                    print(
                                                                        index);
                                                                    if (Cart[index]
                                                                            [
                                                                            '_id'] ==
                                                                        Fav[i][
                                                                            '_id']) {
                                                                      Fav.removeAt(
                                                                          i);
                                                                      saveFavtData();
                                                                    }
                                                                  }
                                                                });
                                                              },
                                                            )),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    height: 30,
                                                    alignment:
                                                        AlignmentDirectional
                                                            .topEnd,
                                                    child: IconButton(
                                                      onPressed: () {
                                                        showAlertDialog(
                                                            context,
                                                            index,
                                                            Cart[index]
                                                                ['name']);
                                                      },
                                                      icon: Icon(
                                                          Icons
                                                              .delete_forever_sharp,
                                                          size: 30,
                                                          color: Colors.red
//                                                            HexColor('#EEAF41'),
                                                          ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Text(
                                              '${Cart[index]['form']}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              'EGP ${Cart[index]['price']}',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.blue,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3.5,
                                            ),
                                            !(!Cart[index]['nostok'] &&
                                                    (Cart[index]['stock'] ||
                                                        !Cart[index]['stock']))
                                                ? Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .check_circle_outline,
                                                        color: Colors.green,
                                                        size: 17,
                                                      ),
                                                      Text(
                                                        'Deliviry in 1 hour',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 13),
                                                      )
                                                    ],
                                                  )
                                                : Row(
                                                    children: [
                                                      Icon(
                                                        Icons.warning_amber,
                                                        color: Colors.red,
                                                        size: 17,
                                                      ),
                                                      Text(
                                                        'May not be available',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 13),
                                                      )
                                                    ],
                                                  ),
                                            SizedBox(
                                              height: 3.5,
                                            ),
                                            !(!Cart[index]['nostok'] &&
                                                    (Cart[index]['stock'] ||
                                                        !Cart[index]['stock']))
                                                ? !(Cart[index]['selectedAdd'])
                                                    ? Container(
                                                        width: 100,
                                                        height: 35,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.blue),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        child: TextButton(
                                                          child: Text(
                                                            'ADD',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            setState(() {
//                                                              isadded = true;
//                                                              total = total + 1;
//                                                              totalPrice += 1 *
//                                                                  pro[index]
//                                                                      .price;
//                                                              print(totalPrice);
//                                                              print(total);
//                                                      print(
//                                                          pro[index].quantity);

                                                              Cart[index][
                                                                  'selectedAdd'] = !Cart[
                                                                      index][
                                                                  'selectedAdd'];
                                                            });
                                                          },
                                                        ),
                                                      )
                                                    : Container(
                                                        width: 100,
                                                        height: 35,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: HexColor(
                                                                '#FF9D46'),
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child: TextButton(
                                                                onPressed: () {
                                                                  setState(() {
//                                                                    total =
//                                                                        total -
//                                                                            1;
//                                                                    print(
//                                                                        total);
//                                                                    totalPrice -= 1 *
//                                                                        pro[index]
//                                                                            .price;
//                                                                    print(
//                                                                        totalPrice);
//                                                                    if (total ==
//                                                                        0) {
//                                                                      isadded =
//                                                                          false;

                                                                    if (Cart[index]
                                                                            .quantity <
                                                                        1) {
                                                                      Cart[index]
                                                                              [
                                                                              'selectedAdd'] =
                                                                          false;
                                                                      Cart.removeAt(
                                                                          index);
                                                                      saveCartData();
                                                                      Cart[index]
                                                                          [
                                                                          'Qty'] = 1;
                                                                    } else if (Cart[index]
                                                                            [
                                                                            'Qty'] ==
                                                                        1) {
                                                                      showAlertDialog(
                                                                          context,
                                                                          index,
                                                                          Cart[index]
                                                                              [
                                                                              'name']);
                                                                    } else {
                                                                      Cart[index]
                                                                          [
                                                                          'Qty']--;
                                                                      for (int i =
                                                                              0;
                                                                          i <=
                                                                              pro.length;
                                                                          i++) {
                                                                        print(
                                                                            index);
//                                                                print(
//                                                                    Cart[i].id);
                                                                        if (Cart[index]['_id'] ==
                                                                            pro[i]['_id']) {
                                                                          pro[i]
                                                                              [
                                                                              'Qty']--;
                                                                        }
                                                                      }
                                                                    }
                                                                  });
                                                                },
                                                                child:
                                                                    Text('-'),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                alignment:
                                                                    AlignmentDirectional
                                                                        .center,
                                                                color: HexColor(
                                                                    '#FF9D46'),
                                                                child: Text(
                                                                  '${Cart[index]['Qty']}',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: TextButton(
                                                                onPressed: () {
                                                                  setState(() {
//                                                                    total =
//                                                                        total +
//                                                                            1;
//                                                                    print(
//                                                                        total);
//                                                                    totalPrice += 1 *
//                                                                        pro[index]
//                                                                            .price;
//                                                                    print(
//                                                                        totalPrice);
                                                                    Cart[index][
                                                                        'Qty']++;
                                                                    for (int i =
                                                                            0;
                                                                        i <=
                                                                            pro.length;
                                                                        i++) {
                                                                      print(
                                                                          index);
//                                                                print(
//                                                                    Cart[i].id);
                                                                      if (Cart[index]
                                                                              [
                                                                              '_id'] ==
                                                                          pro[i]
                                                                              [
                                                                              '_id']) {
                                                                        pro[i][
                                                                            'Qty']++;
                                                                      }
                                                                    }
                                                                  });
                                                                },
                                                                child:
                                                                    Text('+'),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                : Container(
                                                    width: 100,
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: HexColor(
                                                              '#9D9D9D')),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: TextButton(
                                                      child: Text(
                                                        'VIEW',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: HexColor(
                                                              '#9D9D9D'),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          Cart[index][
                                                                  'selectedAdd'] =
                                                              !Cart[index][
                                                                  'selectedAdd'];
                                                        });
                                                      },
                                                    ),
                                                  )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        separatorBuilder: (context, index) => Divider(
//              color: Colors.grey,
                              thickness: 1,
                              endIndent: 15,
                              indent: 15,
                            ),
                        itemCount: Cart.length),
                  ),
                  Container(
                    height: 120,
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Price may vary across pharmacies',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MaterialButton(
                              height: 50,
                              minWidth: double.infinity,
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
                                'CHECKOUT',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: Colors.orange,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }

  showAlertDialog(BuildContext context, int index, name) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        setState(() {});
      },
    );
    Widget canselButton = TextButton(
      child: Text("can"),
      onPressed: () {
        setState(() {
          Navigator.of(context).pop();
        });
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
        title: Center(
      child: Column(
        children: [
          Icon(
            Icons.warning_amber_outlined,
            color: Colors.red,
            size: 60,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Remove item From Cart',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Are you sure you want to remove',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            '$name from cart?',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                height: 50,
                minWidth: double.infinity,
                onPressed: () {
                  setState(() {
                    print('this is index $index');
                    print('this is length${pro.length}');
                    try {
                      if (pro.length == 0) {
                        Cart.removeAt(index);
                        saveCartData();
                      } else {
                        for (int i = 0; i <= pro.length; i++) {
                          print(" this i $i");
                          if (Cart[index]['_id'] == pro[i]['_id']) {
                            print(" this i $i");
                            Cart.removeAt(index);
                            saveCartData();
                            selectedAdd[i] = false;
                            isadded = false;
                            break;
                          }
                        }
                      }
                    } catch (e) {
                      Cart.removeAt(index);
                      saveCartData();
                    }

                    Navigator.of(context).pop();
                  });
                },
                child: Text(
                  'REMOVE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.orange,
              )),
          TextButton(
            child: Text(
              "CANCEL",
              style: TextStyle(fontSize: 20, color: Colors.orange),
            ),
            onPressed: () {
              setState(() {
                Navigator.of(context).pop();
              });
            },
          )
        ],
      ),
    )
//      Text("My title"),
//      content: Text("This is my message to."),
//      actions: [okButton, canselButton],
        );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
