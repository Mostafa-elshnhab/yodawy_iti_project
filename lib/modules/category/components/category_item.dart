import 'package:flutter/material.dart';
import 'package:flutter_app_test/models/category_model.dart';


class CategoryIteM extends StatelessWidget {
  final CategoryItem category;
  final Function press;
  const CategoryIteM({Key? key, required this.category, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){press();},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Stack(
          children: [
            Image.asset(
              category.image,
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 25.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        Color(0xFF179FDB),
                        Color(0xFF179FDB),
                        Color(0xFF21B3E4),
                        Color(0xFF2ECBEE),
                      ],
                      tileMode: TileMode.clamp,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      category.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
