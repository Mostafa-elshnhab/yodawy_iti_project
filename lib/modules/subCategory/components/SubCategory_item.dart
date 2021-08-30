import 'package:flutter/material.dart';

class SubCategoryIteM extends StatelessWidget {
  final String path;
  final String title;
  final Function press;
  const SubCategoryIteM(
      {Key? key, required this.path, required this.title, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Stack(
          children: [
            Image.network(
              '$path',
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
                      title,
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
