import 'package:flutter/material.dart';
import 'package:flutter_app_test/layout/Product/Products.dart';
import 'components/TopPicksAll.dart';
import 'package:flutter_app_test/models/toppicksmodel.dart';
import 'package:flutter_app_test/modules/offers/components/carousel.dart';
import 'package:flutter_app_test/modules/offers/components/toppicks.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  width: double.infinity,
                  height: 170.0,
                  child: CarouselItem(),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Yodawy Top Picks',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20.0,
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          print('AllTopPicks');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllTopPicks()));
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      height: 120.0,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return TopPicks(
                              topPicks: topPick[index],
                              press: () {
                                print('${topPick[index].productName}');
//                                Navigator.push(
//                                    context,
//                                    MaterialPageRoute(
//                                        builder: (context) => Products(
//                                              Text:
//                                                  '${topPick[index].productName}',
//                                            )));
                              });
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 3.0,
                          );
                        },
                        itemCount: topPick.length,
                      )),
                  SizedBox(
                    height: 30.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Offers Of The Day',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      FutureBuilder<List>(
                        future: getoffDataFB(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.blue,
                              ),
                            );
                          }
                          return ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  print(
                                      '${snapshot.data![index]['categories'][0]['name']}');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Products(
                                                3,
                                                Text:
                                                    '${snapshot.data![index]['categories'][0]['name']}',
                                                id: snapshot.data![index]
                                                    ['categories'][0]['_id'],
                                              )));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.network(
                                    '${snapshot.data![index]['path']}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 10.0,
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<List> getoffDataFB() async {
  http.Response response =
      await http.get(Uri.parse("https://yodawy.herokuapp.com/offers"));
  List data = json.decode(response.body);
  return data;
}

Future<List> getAllProuDataFB() async {
  http.Response response = await http
      .get(Uri.parse("https://yodawy.herokuapp.com/products?_limit=400"));
  List data = json.decode(response.body);
  return data;
}
