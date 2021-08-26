import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/layout/Home.dart';
import 'package:flutter_app_test/layout/Product/Products.dart';
import 'allbrandsApi.dart';

Widget BrandsBul() {
  return FutureBuilder<List>(
      future: getbrandDataFB(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 0.0,
              childAspectRatio: 1.5,
              children: List.generate(9, (index) {
                String name = snapshot.data![index]['name'];
                String path = snapshot.data![index]['path'];
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Products(
                                    Text: '$name',
                                  )));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          child: Image.network(
                            '$path',
                            width: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
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
