import 'package:flutter/material.dart';
import 'package:flutter_app_test/Data/Api/Products/ProductsApiFun.dart';
import 'package:flutter_app_test/layout/Cart/CartPage.dart';
import 'package:flutter_app_test/layout/Product/Products.dart';
import 'package:flutter_app_test/shared/components.dart';
import 'package:hexcolor/hexcolor.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isSerched = false;
  bool isscrlol = false;
  int lenght = 4;
  String? searchValue = "";
  @override
  void initState() {
    super.initState();
    getProductSerchDataFB(searchValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(125.0),
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
                  centerTitle: true,
                  title: Container(
                    width: 120,
                    height: 30,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
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
                        width: 50,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
                    ),
                    child: TextField(
                        showCursor: true,
                        autofocus: false,
                        onTap: () {
                          setState(() {
                            isscrlol = true;
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            isSerched = true;
                            getProductSerchDataFB(value);
                            isscrlol = false;
                            searchValue = value;
                            print(value);
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'What Are You Looking for?',
                          hintStyle: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 15,
                          ),
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: Colors.grey[400],
                          ),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
        body: !isSerched
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Search History',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.replay_5_rounded,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Panadol',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 18),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8, right: 8),
                          child: Container(
                            width: double.infinity,
                            height: 1,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.replay_5_rounded,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Panadol',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 18),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8, right: 8),
                          child: Container(
                            width: double.infinity,
                            height: 1,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.replay_5_rounded,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Panadol',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 18),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8, right: 8),
                          child: Container(
                            width: double.infinity,
                            height: 1,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.replay_5_rounded,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Panadol',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 18),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8, right: 8),
                          child: Container(
                            width: double.infinity,
                            height: 1,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.replay_5_rounded,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Panadol',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 18),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8, right: 8),
                          child: Container(
                            width: double.infinity,
                            height: 1,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.replay_5_rounded,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Panadol',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 18),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8, right: 8),
                          child: Container(
                            width: double.infinity,
                            height: 1,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : FutureBuilder<List>(
                future: getProductSerchDataFB(searchValue),
                builder: (context, snapshot) {
                  print(snapshot.hasData);

                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
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
                  } else if (lenght == 0) {
                    return Expanded(
                      child: new Container(
                        height: double.infinity,
                        color: Colors.grey.shade200.withOpacity(0.8),
                        child: Center(
                          child: Text(
                            "No data to Show!\n Please try another name",
                            style: TextStyle(
                                color: Colors.blue,
                                fontFamily: "Cairo1",
                                fontSize: 40.0),
                          ),
                        ),
                      ),
                    );
                  }
                  return ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        getProductSerchDataFB(searchValue)
                            .then((value) => print(value.length));

                        String name = snapshot.data![index]['name'];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Products(2, Text: name)));
                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.search_rounded,
                                      color: Colors.grey.shade600,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        '$name',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 8, right: 8),
                            child: Container(
                              width: double.infinity,
                              height: 1,
                              color: Colors.grey.shade300,
                            ),
                          ),
                      itemCount: snapshot.data!.length);
                }));
  }
}
