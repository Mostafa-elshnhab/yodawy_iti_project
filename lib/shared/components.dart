import 'package:flutter/material.dart';

Widget topPicksItemBuilder({
  @required String? img,
  @required Function? onTap,
}) {
  return GestureDetector(
    onTap: onTap!(),
    child: Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          child: Image.asset(
            img!,
            fit: BoxFit.cover,
            width: 180.0,
          ),
        ),
      ),
    ),
  );
}

Widget offersOfDayItemBuilder({
  @required String? categoryImg,
//  @required Function? productOnTap ,
  @required String? categoryName,
  @required Color? categoryNameColor,
}) {
  return GestureDetector(
    onTap: () {
      print('abdelrehem');
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 130.0,
            child: Image.asset(
              categoryImg!,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 115.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
          Container(
            width: 110.0,
            height: 25.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
              color: Colors.white,
            ),
            child: Text(
              categoryName!,
              style: TextStyle(
                color: categoryNameColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget carouselItemBuilder({
  @required String? imgPath,
  @required Function? onTap,
}) {
  return GestureDetector(
    child: Container(
      child: Image.asset(
        imgPath!,
        fit: BoxFit.cover,
        width: double.infinity,
        height: 200.0,
      ),
    ),
    onTap: onTap!(),
  );
}
