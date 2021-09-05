import 'package:flutter/material.dart';
import 'package:flutter_app_test/Data/Api/Products/ProductsApiFun.dart';
import 'package:flutter_app_test/layout/Cart/CartData.dart';
import 'package:flutter_app_test/layout/Cart/CartPage.dart';
import 'package:flutter_app_test/layout/FavoriteItems/FavData.dart';
import 'package:flutter_app_test/layout/Product/pandoalData.dart';
import 'package:flutter_app_test/layout/Product/product_detalis.dart';
import 'package:flutter_app_test/shared/components.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:math' as math;

String? text;
int? counter;
String? idc;
final selectedAdd = List.filled(100, false);
bool isadded = false;

class Products extends StatefulWidget {
  String? Text;
  int? Counter;
  String? id;
  Products(this.Counter, {@required this.Text, this.id}) {
    text = this.Text!;
    counter = this.Counter;
    idc = this.id;
  }

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  int total = 0;
  double totalPrice = 0;
//  bool selected = false;
//  bool selectedAdd = false;

  final selected = List.filled(100, false);
  final Qty = List.filled(100, 1);

  List<Future<List>> datafun = [
    getProductByBrandDataFB(text),
    getProductBySubDataFB(idc),
    getProductSerchDataFB(text),
    getprouDataFB(idc),
  ];
//  @override
//  void initState() {
//    super.initState();

//  }

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
              child: FutureBuilder<List>(
                  future: datafun[counter!],
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      datafun[counter!].then((value) {
                        setState(() {
//                          ProductData = value;
                        });
                      });
                      return ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          String name = snapshot.data![index]['name'];
                          String id = snapshot.data![index]['_id'];
                          String path = snapshot.data![index]['path'];
                          double Price = snapshot.data![index]['price'] + 0.0;
//                          int Qty = snapshot.data![index]['Qty'];
                          String? form = snapshot.data![index]['form'];
//                          bool selectedAdd = snapshot.data![index]['selectedAdd'];
                          bool? stock = snapshot.data![index]['stock'];
//                          bool selected = snapshot.data![index]['selected'];
                          bool? nostok = snapshot.data![index]['nostok'];
                          pro = snapshot.data!;
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetalis(id)));
                            },
                            child: ListTile(
                              selected: true,
                              title: Container(
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
                                              alignment:
                                                  AlignmentDirectional.center,
                                              child: Image.network(
                                                '$path',
                                                height: 90,
                                                width: 80,
                                              ),
                                            ),
                                            nostok!
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
                                                          color: stock!
                                                              ? HexColor(
                                                                  '#FE4646')
                                                              : HexColor(
                                                                  '#9D9D9D'),
                                                          child: Text(
                                                            stock
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
                                                  '${name.toUpperCase()}',
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
                                                    child: !(selected[index])
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
                                                                selected[
                                                                        index] =
                                                                    !selected[
                                                                        index];
                                                                Fav.add(snapshot
                                                                        .data![
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
                                                                selected[
                                                                        index] =
                                                                    !selected[
                                                                        index];
                                                                for (int i = 0;
                                                                    i <=
                                                                        Fav.length;
                                                                    i++) {
                                                                  print(index);
                                                                  if (id ==
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
                                              )
                                            ],
                                          ),
                                          Text(
                                            '$form',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            'EGP ${Price}',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3.5,
                                          ),
                                          !(!nostok && (stock! || !stock))
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
                                          !(!nostok && (stock! || !stock))
                                              ? !(selectedAdd[index])
                                                  ? Container(
                                                      width: 100,
                                                      height: 35,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.blue),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
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
                                                            Cart.add(snapshot
                                                                .data![index]);
                                                            saveCartData();
                                                            isadded = true;
                                                            total = total + 1;
                                                            totalPrice +=
                                                                1 * Price;
                                                            print(totalPrice);
                                                            print(total);
//                                                      print(
//                                                          pro[index].quantity);

                                                            selectedAdd[index] =
                                                                !selectedAdd[
                                                                    index];
                                                          });
                                                        },
                                                      ),
                                                    )
                                                  : Container(
                                                      width: 100,
                                                      height: 35,
                                                      decoration: BoxDecoration(
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
                                                                  total =
                                                                      total - 1;
                                                                  print(total);
                                                                  totalPrice -=
                                                                      1 * Price;
                                                                  print(
                                                                      totalPrice);
                                                                  if (total ==
                                                                      0) {
                                                                    isadded =
                                                                        false;
                                                                  }
                                                                  if (Qty[index] <=
                                                                      1) {
                                                                    selectedAdd[
                                                                            index] =
                                                                        false;
                                                                    print(
                                                                        index);
//
                                                                    for (int i =
                                                                            0;
                                                                        i <=
                                                                            Cart.length;
                                                                        i++) {
//                                                                print(
//                                                                    Cart[i].id);
                                                                      if (id ==
                                                                          Cart[i]
                                                                              [
                                                                              '_id']) {
                                                                        Cart.removeAt(
                                                                            i);
                                                                        saveCartData();
                                                                      }
                                                                    }
                                                                    Qty == 1;
                                                                  } else {
                                                                    Qty[index]--;
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
                                                              color: HexColor(
                                                                  '#FF9D46'),
                                                              child: Text(
                                                                '${Qty[index]}',
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
                                                                  total =
                                                                      total + 1;
                                                                  print(total);
                                                                  totalPrice +=
                                                                      1 * Price;
                                                                  print(
                                                                      totalPrice);
                                                                  Qty[index]++;
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
                                                        color:
                                                            HexColor('#9D9D9D'),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        selectedAdd[index] =
                                                            !selectedAdd[index];
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
                          );
                        },
                        separatorBuilder: (context, index) => Divider(
//              color: Colors.grey,
                          thickness: 1,
                          endIndent: 15,
                          indent: 15,
                        ),
                        itemCount: snapshot.data!.length,
                      );
                    } else if (snapshot.hasError) {
                      return Expanded(
                        child: new Container(
                          color: Colors.grey.shade200.withOpacity(0.8),
                          child: ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              Center(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Ooooops Network Error!",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontFamily: "Cairo1",
                                        fontSize: 40.0),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    } else if (!snapshot.hasData) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: Colors.blue,
                      ));
                    }
                    return Expanded(
                      child: Center(
                          child: CircularProgressIndicator(
                        color: Colors.blue,
                      )),
                    );
                  })),
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
              : SizedBox()
        ],
      ),
    );
  }
}
