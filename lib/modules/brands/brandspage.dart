import 'package:flutter/material.dart';
import 'package:flutter_app_test/models/brands_page.dart';
import 'package:flutter_app_test/modules/brands/components/brandpageitem.dart';
import 'package:flutter_app_test/shared/components.dart';

class BrandsPage extends StatefulWidget {
  const BrandsPage({Key? key}) : super(key: key);

  @override
  _BrandsPageState createState() => _BrandsPageState();
}

class _BrandsPageState extends State<BrandsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder('Covid Essentials', context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 16 / 10,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15),
            itemCount: 8,
            itemBuilder: (context, index) {
              return BrandPageItem(
                  brandPage: brandPage[index],
                  press: () => print('${brandPage[index].title}'));
            }),
      ),
    );
  }
}
