import 'package:flutter/material.dart';

class TopPicksModel{
  final String imgpath , productName;
  final int id;

  TopPicksModel({ required this.id, required this.imgpath , required this.productName});
}

List<TopPicksModel> topPick = [

    TopPicksModel(
        productName: 'tp1',
        imgpath: 'assets/images/tp1.jpg',
      id: 1,
    ),
    TopPicksModel(
        productName: 'tp2',
        imgpath: 'assets/images/tp2.jpg',
      id: 2,
    ),
    TopPicksModel(
        productName: 'tp3',
        imgpath: 'assets/images/tp3.jpg',
      id: 3,
    ),
    TopPicksModel(
        productName: 'tp4',
        imgpath: 'assets/images/tp4.jpg',
      id: 4,
    ),
    TopPicksModel(
        productName: 'tp5',
        imgpath: 'assets/images/tp5.jpg',
      id: 5,
    ),
    TopPicksModel(
        productName: 'tp6',
        imgpath: 'assets/images/tp6.jpg',
      id: 6,
    ),
    TopPicksModel(
        productName: 'tp7',
        imgpath: 'assets/images/tp7.jpg',
      id: 7,
    ),
    TopPicksModel(
        productName: 'tp8',
        imgpath: 'assets/images/tp8.jpg',
      id: 8,
    ),
  ];
