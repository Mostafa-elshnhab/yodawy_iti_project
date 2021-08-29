import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/Data/Api/SubCategory/subCategoryApi.dart';
import '../../../layout/HomeScreens/Home.dart';
import 'package:flutter_app_test/layout/Product/Products.dart';
import 'package:flutter_app_test/modules/subCategory/components/SubCategory_item.dart';
import 'package:flutter_app_test/modules/subCategory/suBcategory.dart';

Widget SubCategoryBul(id) {
  return FutureBuilder<List>(
      future: getSubCategoryDataFB(id),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        }
//        else if (snapshot.hasError) {
//          return Expanded(
//            child: new Container(
//              color: Colors.grey.shade200.withOpacity(0.8),
//              child: ListView(
//                shrinkWrap: true,
//                children: <Widget>[
//                  Center(
//                    child: Container(
//                      alignment: Alignment.center,
//                      child: Text(
//                        "Ooooops Network Error!",
//                        style: TextStyle(
//                            color: Colors.blue,
//                            fontFamily: "Cairo1",
//                            fontSize: 40.0),
//                      ),
//                    ),
//                  )
//                ],
//              ),
//            ),
//          );
//        }

        return GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 16 / 10,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              String name = snapshot.data![index]['name'];
              String path = snapshot.data![index]['path'];
              String id = snapshot.data![index]['_id'];

              return SubCategoryIteM(
                  path: path,
                  title: name,
                  press: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Products(
                                      1,
                                      Text: name,
                                      id: id,
                                    )))
                      });
            });
      });
}
