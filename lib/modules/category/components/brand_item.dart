import 'package:flutter/material.dart';
import 'package:flutter_app_test/models/brand_model.dart';


class BrandItem extends StatelessWidget {
  final BrandModel brand;
  final Function press;
  const BrandItem({Key? key, required this.brand, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press();
      },
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Container(
            child: Image.asset(
              brand.image,
              fit: BoxFit.cover,
              width: 120.0,
              height: 70.0,
            ),
          ),
        ),
      ),
    );
  }
}
