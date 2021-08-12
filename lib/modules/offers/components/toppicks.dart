import 'package:flutter/material.dart';
import 'package:flutter_app_test/models/toppicksmodel.dart';

class TopPicks extends StatelessWidget {
  final TopPicksModel topPicks;
  final Function press;
  const TopPicks({Key? key, required this.topPicks, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){press();},
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Container(
            child: Image.asset(
              topPicks.imgpath,
              fit: BoxFit.cover,
              width: 180.0,
            ),
          ),
        ),
      ),
    );
  }
}
