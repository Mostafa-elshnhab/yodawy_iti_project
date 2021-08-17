import 'package:flutter/material.dart';
import 'package:flutter_app_test/layout/Cart/CartData.dart';
import 'package:flutter_app_test/layout/Cart/CartPage.dart';
import 'package:flutter_app_test/layout/FavoriteItems/FavData.dart';
import 'package:flutter_app_test/layout/Product/pandoalData.dart';
import 'package:flutter_app_test/layout/Product/product_detalis.dart';
import 'package:flutter_app_test/shared/components.dart';
import 'package:hexcolor/hexcolor.dart';

import 'dart:math' as math;

String? text;

class Products extends StatefulWidget {
  String? Text;
  Products({@required this.Text}) {
    text = this.Text!;
  }

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  bool isadded = false;
  int total = 0;
  double totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      bottomNavigationBar: BottomAppBar(
//        child: Container(
//          height: 50.0,
//          width: double.maxFinite,
//          decoration: BoxDecoration(
//            color: Colors.deepOrange,
//          ),
//          child: Row(
//            mainAxisSize: MainAxisSize.max,
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              IconButton(
//                icon: Icon(Icons.arrow_forward),
//                onPressed: () {},
//              ),
//              IconButton(
//                icon: Icon(Icons.arrow_downward),
//                onPressed: () {},
//              ),
//              IconButton(
//                icon: Icon(Icons.arrow_left),
//                onPressed: () {},
//              ),
//              IconButton(
//                icon: Icon(Icons.arrow_upward),
//                onPressed: () {},
//              ),
//            ],
//          ),
//        ),
//      ),
      appBar: appBarBuilder('$text', context),
      body: Column(
//        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisSize: MainAxisSize.max,
//        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => ListTile(
                      selected: true,
                      title: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetalis(index)));
                        },
                        child: Container(
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 120,
                                  width: 150,
                                  child: Stack(
                                    children: [
                                      Container(
                                        alignment: AlignmentDirectional.center,
                                        child: Image.network(
                                          '${pro[index].path}',
                                          height: 90,
                                          width: 80,
                                        ),
                                      ),
                                      pro[index].nostok
                                          ? Text('')
                                          : Transform.rotate(
                                              angle: -math.pi / 4,
                                              child: Container(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Container(
                                                    alignment:
                                                        AlignmentDirectional
                                                            .center,
                                                    height: 20,
//                                        width: 95,
                                                    color: pro[index].stock
                                                        ? HexColor('#FE4646')
                                                        : HexColor('#9D9D9D'),
                                                    child: Text(
                                                      pro[index].stock
                                                          ? 'Low Stock'
                                                          : 'Out of Stock',
                                                      style: TextStyle(
                                                          color: Colors.white,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
//                                mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            '${(pro[index].name).toUpperCase()}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              height: 30,
                                              alignment:
                                                  AlignmentDirectional.topEnd,
                                              child: !(pro[index].selected)
                                                  ? IconButton(
                                                      icon: Icon(
                                                        Icons
                                                            .star_border_outlined,
                                                        size: 30,
                                                        color:
                                                            HexColor('#EEAF41'),
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          pro[index].selected =
                                                              !pro[index]
                                                                  .selected;
                                                          Fav.add(pro[index]);
                                                        });
                                                      },
                                                    )
                                                  : IconButton(
                                                      icon: Icon(
                                                        Icons.star,
                                                        size: 30,
                                                        color:
                                                            HexColor('#EEAF41'),
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          pro[index].selected =
                                                              !pro[index]
                                                                  .selected;
                                                          for (int i = 0;
                                                              i <= Fav.length;
                                                              i++) {
                                                            print(index);
                                                            if (index ==
                                                                Fav[i].id) {
                                                              Fav.removeAt(i);
                                                            }
                                                          }
                                                        });
                                                      },
                                                    )),
                                        )
                                      ],
                                    ),
                                    Text(
                                      '${pro[index].form}',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 13),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'EGP ${pro[index].price}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3.5,
                                    ),
                                    !(!pro[index].nostok &&
                                            (pro[index].stock ||
                                                !pro[index].stock))
                                        ? Row(
                                            children: [
                                              Icon(
                                                Icons.check_circle_outline,
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
                                    !(!pro[index].nostok &&
                                            (pro[index].stock ||
                                                !pro[index].stock))
                                        ? !(pro[index].selectedAdd)
                                            ? Container(
                                                width: 100,
                                                height: 35,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.blue),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: TextButton(
                                                  child: Text(
                                                    'ADD',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      Cart.add(pro[index]);
                                                      isadded = true;
                                                      total = total + 1;
                                                      totalPrice +=
                                                          1 * pro[index].price;
                                                      print(totalPrice);
                                                      print(total);
//                                                      print(
//                                                          pro[index].quantity);

                                                      pro[index].selectedAdd =
                                                          !pro[index]
                                                              .selectedAdd;
                                                    });
                                                  },
                                                ),
                                              )
                                            : Container(
                                                width: 100,
                                                height: 35,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: HexColor('#FF9D46'),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: TextButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            total = total - 1;
                                                            print(total);
                                                            totalPrice -= 1 *
                                                                pro[index]
                                                                    .price;
                                                            print(totalPrice);
                                                            if (total == 0) {
                                                              isadded = false;
                                                            }
                                                            if (pro[index]
                                                                    .quantity <=
                                                                1) {
                                                              pro[index]
                                                                      .selectedAdd =
                                                                  false;
                                                              print(index);
//
                                                              for (int i = 0;
                                                                  i <=
                                                                      Cart.length;
                                                                  i++) {
                                                                print(index);
//                                                                print(
//                                                                    Cart[i].id);
                                                                if (index ==
                                                                    Cart[i]
                                                                        .id) {
                                                                  Cart.removeAt(
                                                                      i);
                                                                }
                                                              }
                                                              pro[index]
                                                                      .quantity ==
                                                                  1;
                                                            } else {
                                                              pro[index]
                                                                  .quantity--;
                                                            }
                                                          });
                                                        },
                                                        child: Text('-'),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        alignment:
                                                            AlignmentDirectional
                                                                .center,
                                                        color:
                                                            HexColor('#FF9D46'),
                                                        child: Text(
                                                          '${pro[index].quantity}',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: TextButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            total = total + 1;
                                                            print(total);
                                                            totalPrice += 1 *
                                                                pro[index]
                                                                    .price;
                                                            print(totalPrice);
                                                            pro[index]
                                                                .quantity++;
                                                          });
                                                        },
                                                        child: Text('+'),
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
                                                  color: HexColor('#9D9D9D')),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: TextButton(
                                              child: Text(
                                                'VIEW',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: HexColor('#9D9D9D'),
                                                ),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  pro[index].selectedAdd =
                                                      !pro[index].selectedAdd;
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
                itemCount: pro.length),
          ),
          isadded
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartPage()));
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
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
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
