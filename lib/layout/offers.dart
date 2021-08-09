import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter_app_test/models/carouselmodel.dart';
import 'package:flutter_app_test/models/offersmodel.dart';
import 'package:flutter_app_test/models/offersofday.dart';
import 'package:flutter_app_test/shared/components.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  List<TopPicksModel> getTopPicksImg() {
    return [
      TopPicksModel(imgpath: 'assets/images/tp1.jpg'),
      TopPicksModel(imgpath: 'assets/images/tp2.jpg'),
      TopPicksModel(imgpath: 'assets/images/tp3.jpg'),
      TopPicksModel(imgpath: 'assets/images/tp4.jpg'),
    ];
  }

  List<OffersOfDay> getOffersOfDayData() {
    return [
      OffersOfDay(
        categoryName: 'BABY CARE',
        categoryNameColor: Colors.orange[700],
        imgPath: 'assets/images/baby_care.jpg',
      ),
      OffersOfDay(
        categoryName: 'SKIN CARE',
        categoryNameColor: Colors.purple,
        imgPath: 'assets/images/skin_care.jpg',
      ),
      OffersOfDay(
        categoryName: 'HAIR CARE',
        categoryNameColor: Colors.red,
        imgPath: 'assets/images/hair_care.jpg',
      ),
      OffersOfDay(
        categoryName: 'WOMEN CARE',
        categoryNameColor: Colors.pinkAccent,
        imgPath: 'assets/images/women_care.jpg',
      ),
      OffersOfDay(
        categoryName: 'MEN CARE',
        categoryNameColor: Colors.blue,
        imgPath: 'assets/images/men_care.jpg',
      ),
      OffersOfDay(
        categoryName: 'ORAL CARE',
        categoryNameColor: Colors.orange[200],
        imgPath: 'assets/images/oral_care.jpg',
      ),
    ];
  }

  List<CarouselModel> getCarouselImg() {
    return [
      CarouselModel(
        carouselImg: 'assets/images/cantu.jpg',
      ),
      CarouselModel(
        carouselImg: 'assets/images/similac.jpg',
      ),
      CarouselModel(
        carouselImg: 'assets/images/cerelac.jpg',
      ),
      CarouselModel(
        carouselImg: 'assets/images/durex.jpg',
      ),
      CarouselModel(
        carouselImg: 'assets/images/bless.jpeg',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<TopPicksModel> topPicksList = getTopPicksImg();
    List<OffersOfDay> offersOfDayList = getOffersOfDayData();
    List<CarouselModel> carouselImgList = getCarouselImg();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  width: double.infinity,
                  height: 180.0,
                  child: Carousel(
                    dotBgColor: Colors.transparent,
                    dotColor: Colors.black,
                    dotIncreasedColor: Colors.brown,
                    dotSize: 6.0,
                    dotSpacing: 14.0,
                    dotIncreaseSize: 1.5,
                    images: carouselImgList.map((e) {
                      return carouselItemBuilder(
                        imgPath: e.carouselImg,
                        onTap: () => print('Carousel Clicked'),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Yodawy Top Picks',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20.0,
                        ),
                      ),
                      MaterialButton(
                        onPressed: () => print('View All Clicked'),
                        child: Text(
                          'View All',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 120.0,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return topPicksItemBuilder(
                          img: topPicksList[index].imgpath,
                          onTap: () => print('Top Picks Clicked'),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 3.0,
                        );
                      },
                      itemCount: topPicksList.length,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Offers Of The Day',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return offersOfDayItemBuilder(
                              categoryImg: offersOfDayList[index].imgPath,
                              categoryName: offersOfDayList[index].categoryName,
                              categoryNameColor:
                                  offersOfDayList[index].categoryNameColor,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 10.0,
                            );
                          },
                          itemCount: offersOfDayList.length),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
