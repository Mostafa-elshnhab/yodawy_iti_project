import 'package:flutter/material.dart';
import 'package:flutter_app_test/Data/Api/SubCategory/SubCategBrandsApi.dart';
import 'package:flutter_app_test/Data/Api/SubCategory/subCategbradFutBuild.dart';
import 'package:flutter_app_test/Data/Api/SubCategory/subCategoryApi.dart';
import 'package:flutter_app_test/Data/Api/SubCategory/subCtegoryFuterBuilder.dart';
import 'package:flutter_app_test/layout/Product/Products.dart';
import 'package:flutter_app_test/models/brand_model.dart';
import 'package:flutter_app_test/models/category_model.dart';
import 'package:flutter_app_test/modules/brands/brandspage.dart';
import 'package:flutter_app_test/shared/components.dart';

import 'components/brand_item.dart';
import 'components/SubCategory_item.dart';

String? titele;
String? idc;

class SuBCategory extends StatefulWidget {
  String? tite;
  String? id;
  SuBCategory(this.tite, this.id) {
    titele = this.tite;
    idc = this.id;
  }
  @override
  _SuBCategoryState createState() => _SuBCategoryState();
}

class _SuBCategoryState extends State<SuBCategory> {
  bool isSale = false;
  bool isbrand = false;
  String path = "";
  @override
  void initState() {
    super.initState();
    getSubCategoryDataFB(idc);
    getSubCategorybrandDataFB(idc).then((value) {
      if (value.length != 0) {
        setState(() {
          isbrand = true;
        });

        print('hasdjashkjdhasjkhdjk');
      }
    });
    getSubCategoryoffersDataFB(idc).then((value) {
      if (value.length != 0) {
        setState(() {
          isSale = true;
          path = value[0]['path'];
        });
      }
    });
    print(idc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarBuilder('$titele', context),
        body: FutureBuilder(
            initialData: [
              getSubCategoryDataFB(idc),
              getSubCategorybrandDataFB(idc)
            ],
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isbrand
                          ? Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Browse by Brand',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BrandsPage(
                                                        title: titele,
                                                        id: idc)));
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
                                  height: 70.0,
                                  child: SubCategorybrand(idc),
                                ),
                              ],
                            )
                          : SizedBox(),
                      SizedBox(
                        height: 30.0,
                      ),
                      isSale
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 120.0,
                                  child: Image.network(
                                    '$path',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                      Text(
                        'Browse By Category',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SubCategoryBul(idc)
                    ],
                  ),
                ),
              );
            }));
  }
}
