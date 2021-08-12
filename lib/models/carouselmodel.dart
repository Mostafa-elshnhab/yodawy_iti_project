import 'package:flutter/material.dart';

class CarouselModel {
  final String carouselImg , productName;
  final int id;

  CarouselModel({required this.id, required this.carouselImg , required this.productName});
}

List<CarouselModel> carouselItem = [

    CarouselModel(
      productName: 'cantu',
      carouselImg: 'assets/images/cantu.jpg',
      id: 1,
    ),
    CarouselModel(
      productName: 'similac',
      carouselImg: 'assets/images/similac.jpg',
      id: 2,
    ),
    CarouselModel(
      productName: 'cerelac',
      carouselImg: 'assets/images/cerelac.jpg',
      id: 3,
    ),
    CarouselModel(
      productName: 'durex',
      carouselImg: 'assets/images/durex.jpg',
      id: 4,
    ),
    CarouselModel(
      productName: 'bless',
      carouselImg: 'assets/images/bless.jpeg',
      id: 5,
    ),
  ];

