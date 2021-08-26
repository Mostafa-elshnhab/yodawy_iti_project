import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/layout/Home.dart';
import 'package:flutter_app_test/modules/subCategory/suBcategory.dart';

import 'categoryApi.dart';

Widget CategoryBul() {
  return FutureBuilder<List>(
      future: getCategoryDataFB(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 8.0,
              children: List.generate(snapshot.data!.length, (index) {
                String name = snapshot.data![index]['name'];
                String path = snapshot.data![index]['path'];
                String id = snapshot.data![index]['_id'];
                return Center(
                    child: Container(
                        child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              print('hamada');
                              if (index == 0) {
                                current = 1;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyHomePage()));
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SuBCategory(name, id)));
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      '$path',
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                        Text(
                          '$name',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ]),
                )));
              }));
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
        }
        return Expanded(
          child: Center(
            child: Container(
                color: Colors.grey.withOpacity(.8),
                child: Image.asset('assets/images/1.jpg')),
          ),
        );
      });
}
