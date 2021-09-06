import 'package:flutter/material.dart';
import 'package:flutter_app_test/Data/Api/Products/ProductsApiFun.dart';
import 'package:flutter_app_test/Data/Users/userData.dart';
import 'package:flutter_app_test/layout/Cart/CartData.dart';
import 'package:flutter_app_test/layout/Cart/CartPage.dart';
import 'package:flutter_app_test/layout/FavoriteItems/FavData.dart';
import 'package:flutter_app_test/layout/Product/pandoalData.dart';
import 'package:flutter_app_test/models/product_model.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:math' as math;

import 'Products.dart';

String? idP;
bool? selectedAd;

class ProductDetalis extends StatefulWidget {
  String id;
  ProductDetalis(this.id, {bool? select}) {
    idP = this.id;
    selectedAd = select;
  }

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetalis> {
  List<product> ditale = [];
  _ProductDetailsState() {}
  List<dynamic> ProductData = [];
  bool selected = false;
  String? name;
  String? path;
  double? Price;
  int Qty = 0;
  String? form;
  String? type;
  String? description;
  bool? isavailable;
  bool? stock;
  bool? nostok;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    if (Qty > 1) {
//      selectedAd = true;
//    }
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
        body: FutureBuilder<List>(
          future: getProductByIDFB(idP),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            } else if (snapshot.hasData) {
              name = snapshot.data![0]['name'];
              path = snapshot.data![0]['path'];
              Price = snapshot.data![0]['price'] + 0.0;
              Qty = snapshot.data![0]['Qty'];
              form = snapshot.data![0]['form'];
              type = snapshot.data![0]['type'];
              description = snapshot.data![0]['description'];
              isavailable = snapshot.data![0]['isavailable'];
              stock = snapshot.data![0]['stock'];
              nostok = snapshot.data![0]['nostok'];
              ProductData = snapshot.data!;
              return Column(
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
                                  '${path}',
                                  height: 160,
//                      width: 80,
                                ),
                              ),
                              nostok!
                                  ? Text('')
                                  : Transform.rotate(
                                      angle: -math.pi / 4,
                                      child: Container(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                            alignment:
                                                AlignmentDirectional.center,
                                            height: 30,
//                                        width: 95,
                                            color: stock!
                                                ? HexColor('#FE4646')
                                                : HexColor('#9D9D9D'),
                                            child: Text(
                                              stock!
                                                  ? 'Low Stock'
                                                  : 'Out of Stock',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
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
                                  '${name}',
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
                                        'EGP ${Price}',
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
                                    !(selected)
                                        ? IconButton(
                                            icon: Icon(
                                              Icons.star_border_outlined,
                                              size: 30,
                                              color: HexColor('#EEAF41'),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                selected = !selected;
                                                print(selected);
                                                Fav.add(ProductData[0]);
                                                saveFavtData();
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
                                                selected = !selected;
                                                for (int i = 0;
                                                    i <= Fav.length;
                                                    i++) {
                                                  print(idP);
                                                  if (idP == Fav[i]['_id']) {
                                                    Fav.removeAt(i);
                                                    saveFavtData();
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
                          padding:
                              EdgeInsetsDirectional.only(top: 8, start: 10),
                          height: 40,
                          color: HexColor('#F5F5F5'),
                          child: Text(
                            'Product Details',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 10),
                          child: Text(
                            'Description',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 10),
                          child: Text(
                            '${description}',
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 10),
                          child: Text(
                            '${form}',
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 10),
                          child: Text(
                            '$type',
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
                        child: !selectedAd!
                            ? MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    selectedAd = true;
                                    print(selectedAdd);
                                    Cart.add(ProductData[0]);
                                    saveCartData();
                                    total = total + 1;
                                    totalPrice += 1 * Price!;
                                    for (int i = 0; i <= pro.length; i++) {
                                      if (idP == pro[i]['_id']) {
                                        selectedAdd[i] = true;
                                        break;
                                      }
                                    }
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
                            :
//                          MaterialButton(
//                                  onPressed: () {
//                                    setState(() {
//                                      for (int i = 0; i <= Cart.length; i++) {
//                                        print(" this i $i");
//                                        if (Cart[i]['_id'] ==
//                                            ProductData[0]['_id']) {
//                                          print(" this i $i");
//                                          Cart.removeAt(i);
//                                          saveCartData();
//                                          break;
//                                        }
//                                      }
//                                    });
//                                    selectedAd = false;
//                                    total = total - 1;
//                                    totalPrice -= 1 * Price!;
//                                  },
//                                  child: Text(
//                                    'REMOVE FROM CART',
//                                    style: TextStyle(
//                                      color: Colors.white,
//                                      fontSize: 18,
//                                      fontWeight: FontWeight.bold,
//                                    ),
//                                  ),
//                                  color: Colors.grey,
//                                )

                            Container(
//                        width: 100,
//                        height: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: HexColor('#FF9D46'), width: 3),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            if (Qty <= 1) {
                                              setState(() {
                                                for (int i = 0;
                                                    i <= Cart.length;
                                                    i++) {
                                                  print(" this i $i");
                                                  if (Cart[i]['_id'] ==
                                                      ProductData[0]['_id']) {
                                                    print(" this i $i");
                                                    Cart.removeAt(i);
                                                    saveCartData();
                                                    break;
                                                  }
                                                }
                                                for (int i = 0;
                                                    i <= pro.length;
                                                    i++) {
                                                  if (idP == pro[i]['_id']) {
                                                    selectedAdd[i] = false;
                                                    break;
                                                  }
                                                }
                                              });
                                              selectedAd = false;

                                              Qty = 0;
                                              total = total - 1;
                                              print(total);
                                              totalPrice -= 1 * Price!;
                                            } else {
                                              total = total - 1;
                                              print(total);
                                              totalPrice -= 1 * Price!;
                                              Qty--;
                                            }
                                          });
                                        },
                                        child: Text(
                                          '-',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        alignment: AlignmentDirectional.center,
                                        color: HexColor('#FF9D46'),
                                        child: Text(
                                          '${Qty} in cart',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            total = total + 1;
                                            print(total);
                                            totalPrice += 1 * Price!;
                                            Qty++;
                                          });
                                        },
                                        child: Text(
                                          '+',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                  )
                ],
              );
            }
            return SizedBox();
          },
        ));
  }
}
