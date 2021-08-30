import 'package:flutter/material.dart';

class BrandItem extends StatelessWidget {
  final String path;
  final Function press;
  const BrandItem({Key? key, required this.path, required this.press})
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
            child: Image.network(
              '$path',
              fit: BoxFit.fitWidth,
              width: 120.0,
              height: 70.0,
            ),
          ),
        ),
      ),
    );
  }
}
