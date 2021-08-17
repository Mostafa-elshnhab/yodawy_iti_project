import 'package:flutter/material.dart';
import 'package:flutter_app_test/layout/Cart/CartPage.dart';
import 'package:flutter_app_test/layout/FavoriteItems/FavData.dart';
import 'package:flutter_app_test/layout/Product/pandoalData.dart';
import 'package:flutter_app_test/models/product_model.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:math' as math;

class ProductDetalis extends StatefulWidget {
  int index;
  ProductDetalis(this.index);

  @override
  _ProductDetailsState createState() => _ProductDetailsState(index);
}

class _ProductDetailsState extends State<ProductDetalis> {
  int index;

  List<product> ditale = [];
  _ProductDetailsState(this.index) {}

  bool selected = false;
  bool selectedAdd = false;

  @override
  Widget build(BuildContext context) {
    if (pro[index].quantity > 1) {
      selectedAdd = true;
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
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
              'Product Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartPage()));
                      },
                      child: Container(
                        alignment: AlignmentDirectional.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Row(
                          children: [
                            Icon(
                              Icons.shopping_cart_rounded,
                              color: HexColor('#22C4EC'),
                              size: 30,
                            ),
                            Text(
                              '${pro[index].quantity}',
                              style: TextStyle(color: Colors.blue),
                            )
                          ],
                        ),
                        width: 60,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Container(
                        alignment: AlignmentDirectional.center,
                        child: Image.network(
                          '${pro[index].path}',
                          height: 160,
//                      width: 80,
                        ),
                      ),
                      pro[index].nostok
                          ? Text('')
                          : Transform.rotate(
                              angle: -math.pi / 4,
                              child: Container(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    alignment: AlignmentDirectional.center,
                                    height: 30,
//                                        width: 95,
                                    color: pro[index].stock
                                        ? HexColor('#FE4646')
                                        : HexColor('#9D9D9D'),
                                    child: Text(
                                      pro[index].stock
                                          ? 'Low Stock'
                                          : 'Out of Stock',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  )),
                            ),
//
                    ],
                  ),
                ),
                Divider(
//              color: Colors.grey,
                  thickness: 1.5,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    alignment: AlignmentDirectional.topStart,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${pro[index].name}',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'EGP ${pro[index].price}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.share_rounded,
                                color: Colors.green,
                                size: 25,
                              ),
                              onPressed: () {},
                            ),
                            !(pro[index].selected)
                                ? IconButton(
                                    icon: Icon(
                                      Icons.star_border_outlined,
                                      size: 30,
                                      color: HexColor('#EEAF41'),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        pro[index].selected =
                                            !pro[index].selected;
                                        Fav.add(pro[index]);
                                      });
                                    },
                                  )
                                : IconButton(
                                    icon: Icon(
                                      Icons.star,
                                      size: 30,
                                      color: HexColor('#EEAF41'),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        pro[index].selected =
                                            !pro[index].selected;
                                        for (int i = 0; i <= Fav.length; i++) {
                                          print(index);
                                          if (index == Fav[i].id) {
                                            Fav.removeAt(i);
                                          }
                                        }
                                      });
                                    },
                                  ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_circle_rounded,
                              color: Colors.green,
                              size: 22,
                            ),
                            Text(
                              ' Deliviry in 1 hour',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsetsDirectional.only(top: 8, start: 10),
                  height: 40,
                  color: HexColor('#F5F5F5'),
                  child: Text(
                    'Product Details',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10),
                  child: Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10),
                  child: Text(
                    '${pro[index].descreption}',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10),
                  child: Text(
                    'Form',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10),
                  child: Text(
                    '${pro[index].form}',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10),
                  child: Text(
                    'Type',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10),
                  child: Text(
                    'Local',
                    style: TextStyle(fontSize: 14),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 70,
            width: double.infinity,
            color: Colors.white,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: !selectedAdd
                    ? MaterialButton(
                        onPressed: () {
                          setState(() {
                            selectedAdd = true;
                          });
                        },
                        child: Text(
                          'ADD TO CART',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Colors.orange,
                      )
                    : Container(
//                        width: 100,
//                        height: 35,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: HexColor('#FF9D46'), width: 3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
//                            total = total - 1;
//                            print(total);
//                            totalPrice -= 1 *
//                                pro[index]
//                                    .price;
//                            print(totalPrice);
//                            if (total == 0) {
//                              isadded = false;
//                            }
                                    if (pro[index].quantity <= 1) {
                                      selectedAdd = false;
                                      pro[index].quantity = 0;
                                    } else {
                                      pro[index].quantity--;
                                    }
                                  });
                                },
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                alignment: AlignmentDirectional.center,
                                color: HexColor('#FF9D46'),
                                child: Text(
                                  '${pro[index].quantity} in cart',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
//                            total = total + 1;
//                            print(total);
//                            totalPrice += 1 *
//                                pro[index]
//                                    .price;
//                            print(totalPrice);
                                    pro[index].quantity++;
                                  });
                                },
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
          )
        ],
      ),
    );
  }
}
