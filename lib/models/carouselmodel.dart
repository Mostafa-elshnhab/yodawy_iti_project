import 'package:flutter/material.dart';

class CarouselModel {
  final String carouselImg, productName;
  final int id;

  CarouselModel(
      {required this.id, required this.carouselImg, required this.productName});
}

List<CarouselModel> carouselItem = [
  CarouselModel(
    productName: 'Cantu',
    carouselImg: 'assets/images/cantu.jpg',
    id: 1,
  ),
  CarouselModel(
    productName: 'Similac',
    carouselImg: 'assets/images/similac.jpg',
    id: 2,
  ),
  CarouselModel(
    productName: 'Cerelac',
    carouselImg: 'assets/images/cerelac.jpg',
    id: 3,
  ),
  CarouselModel(
    productName: 'Durex',
    carouselImg: 'assets/images/durex.jpg',
    id: 4,
  ),
  CarouselModel(
    productName: 'Bless',
    carouselImg: 'assets/images/bless.jpeg',
    id: 5,
  ),
];
