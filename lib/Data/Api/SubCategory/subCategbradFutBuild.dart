import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/Data/Api/SubCategory/subCategoryApi.dart';
import 'package:flutter_app_test/layout/Product/Products.dart';
import 'package:flutter_app_test/modules/subCategory/components/SubCategory_item.dart';
import 'package:flutter_app_test/modules/subCategory/components/brand_item.dart';

import 'SubCategBrandsApi.dart';

Widget SubCategorybrand(id) {
  return FutureBuilder<List>(
      future: getSubCategorybrandDataFB(id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              String name = snapshot.data![index]['name'];
              String path = snapshot.data![index]['path'];

              return BrandItem(
                  path: path,
                  press: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Products(Text: name)))
                      });
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 3.0,
              );
            },
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
