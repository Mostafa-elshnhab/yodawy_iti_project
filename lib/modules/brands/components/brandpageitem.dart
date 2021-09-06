import 'package:flutter/material.dart';

class BrandPageItem extends StatelessWidget {
  final String path;
  final Function press;
  const BrandPageItem({Key? key, required this.path, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Image.network(
          '$path',
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
