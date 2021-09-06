import 'package:flutter/material.dart';
import 'package:flutter_app_test/Data/Api/SubCategory/SubCategBrandsApi.dart';
import 'package:flutter_app_test/layout/HomeScreens/Home.dart';
import 'package:flutter_app_test/models/brands_page.dart';
import 'package:flutter_app_test/modules/brands/components/brandpageitem.dart';
import 'package:flutter_app_test/shared/components.dart';

String? titl;
String? idc;

class BrandsPage extends StatefulWidget {
  String? title;
  String? id;
  BrandsPage({Key? key, this.id, this.title}) : super(key: key) {
    titl = this.title;
    idc = this.id;
  }

  @override
  _BrandsPageState createState() => _BrandsPageState();
}

class _BrandsPageState extends State<BrandsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder('$titl', context),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder<List>(
              future: getSubCategorybrandDataFB(idc),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
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
                        String path = snapshot.data![index]['path'];
                        return BrandPageItem(
                            path: path,
                            press: () => print('${brandPage[index].title}'));
                      });
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
              })),
    );
  }
}
