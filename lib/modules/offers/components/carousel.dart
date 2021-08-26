import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/layout/Product/Products.dart';
import 'package:flutter_app_test/models/carouselmodel.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Carousel(
      dotBgColor: Colors.transparent,
      dotColor: Colors.black,
      dotIncreasedColor: Colors.brown,
      dotSize: 6.0,
      dotSpacing: 14.0,
      dotIncreaseSize: 1.5,
      images: carouselItem.map((e) {
        return GestureDetector(
            child: Container(
              child: Image.asset(
                '${e.carouselImg}',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200.0,
              ),
            ),
            onTap: () {
//              Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => Products(
//                            Text: '${e.productName.toUpperCase()}',
//                          )));
            });
      }).toList(),
    );
  }
}
