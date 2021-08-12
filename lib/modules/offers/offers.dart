import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/models/carouselmodel.dart';
import 'package:flutter_app_test/models/offersofday.dart';
import 'package:flutter_app_test/models/toppicksmodel.dart';
import 'package:flutter_app_test/modules/offers/components/carousel.dart';
import 'package:flutter_app_test/modules/offers/components/offers_of_day.dart';
import 'package:flutter_app_test/modules/offers/components/toppicks.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
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
                  child: CarouselItem(
                      press: () =>
                          print('${carouselItem.map((e) => e.productName)}')),
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
                          return TopPicks(
                              topPicks: topPick[index],
                              press: () =>
                                  print('${topPick[index].productName}'));
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 3.0,
                          );
                        },
                        itemCount: topPick.length,
                      )),
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
                            return OffersDay(
                                offersOfDay: offersOfDay[index],
                                press: () => print(
                                    '${offersOfDay[index].categoryName}'));
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 10.0,
                            );
                          },
                          itemCount: offersOfDay.length),
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
