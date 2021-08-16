import 'package:flutter/material.dart';
import 'package:flutter_app_test/layout/Product/Products.dart';
import 'package:flutter_app_test/models/brand_model.dart';
import 'package:flutter_app_test/models/category_model.dart';
import 'package:flutter_app_test/modules/brands/brandspage.dart';
import 'package:flutter_app_test/modules/category/components/brand_item.dart';
import 'package:flutter_app_test/modules/category/components/category_item.dart';
import 'package:flutter_app_test/shared/components.dart';

String? titele;

class Category extends StatefulWidget {
  String? tite;
  Category(this.tite) {
    titele = this.tite;
  }
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool isSale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder('$titele', context),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              builder: (context) => BrandsPage()));
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
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return BrandItem(
                        brand: brand[index],
                        press: () => print(brand[index].title));
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 3.0,
                    );
                  },
                  itemCount: 6,
                ),
              ),
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
                          child: Image.asset(
                            '',
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
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 16 / 10,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                  itemCount: category.length,
                  itemBuilder: (context, index) {
                    return CategoryIteM(
                        category: category[index],
                        press: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Products(
                                          Text: category[index].title)))
                            });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
