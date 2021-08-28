//
//import 'package:flutter/material.dart';
//import 'package:flutter_app_test/models/offersofday.dart';
//
//
//class OffersDay extends StatelessWidget {
//  final OffersOfDay offersOfDay;
//  final Function press;
//  const OffersDay({Key? key, required this.offersOfDay, required this.press}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return GestureDetector(
//      onTap: () => press(),
//      child: ClipRRect(
//        borderRadius: BorderRadius.circular(5.0),
//        child: Image.asset(
//          '${offersOfDay.imgPath}',
//          fit: BoxFit.cover,
//        ),
//      ),
//    );
//  }
//}
