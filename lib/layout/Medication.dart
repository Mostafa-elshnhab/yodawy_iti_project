import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/models/Doctors_models.dart';
import 'package:flutter_app_test/shared/Doctors.dart';
import 'package:flutter_app_test/shared/components.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Insurance.dart';
import 'Product/Products.dart';
import 'TalkToDoctor/requestScreen.dart';

class Medication extends StatelessWidget {
  const Medication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarBuilder('Medication'),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
//              Stack(
//                alignment: AlignmentDirectional.topStart,
//                children: [
//                  Container(
//                    width: double.infinity,
//                    child: Image.asset(
//                      'assets/images/gift.jpg',
//                      fit: BoxFit.cover,
//                    ),
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.all(10.0),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: [
//                        Text(
//                          isLogin! ? 'YOU EAENED EGP30' : 'SIGN & GET EGP30',
//                          style: TextStyle(
//                            fontSize: 25,
//                            fontWeight: FontWeight.w900,
//                          ),
//                        ),
//                        SizedBox(
//                          height: 6,
//                        ),
//                        Text('Applies on first order only'),
//                        SizedBox(
//                          height: 3,
//                        ),
//                        Text(isLogin! ? 'Min order value EGP 100' : ''),
//                        SizedBox(
//                          height: 6,
//                        ),
//                        Row(
//                          children: [
//                            isLogin!
//                                ? Text(
//                              'Promo Code:',
//                              style: TextStyle(
//                                color: HexColor('#85BAC6'),
//                                fontSize: 18,
//                              ),
//                            )
//                                : Text(
//                              'SIGN UP',
//                              style: TextStyle(
//                                  fontSize: 18,
//                                  fontWeight: FontWeight.bold,
//                                  color: Colors.blue),
//                            ),
//                            SizedBox(
//                              width: 4,
//                            ),
//                            isLogin!
//                                ? Text(
//                              'NEW30',
//                              style: TextStyle(
//                                  fontSize: 20,
//                                  fontWeight: FontWeight.w900,
//                                  color: HexColor('#2092CA')),
//                            )
//                                : Icon(
//                              Icons.chevron_right_outlined,
//                              size: 15,
//                              color: Colors.blue,
//                            )
//                          ],
//                        )
//                      ],
//                    ),
//                  )
//                ],
//              ),
                Text(
                  'Popular Searches',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                Wrap(
                  children: [
                    child('Panadol', context),
                    child('Bepanthen', context),
                    child('Zitharomx', context),
                    child('Zinc', context),
                    child('Pravotin', context),
                    child('Omega 3', context),
                    child('Dentinox', context),
                    child('C Retard', context),
                    child('Panthenol', context),
                    child('Centrum', context),
                    child('Vitamine C', context),
                    child('Fucidin', context),
                    child('Ectomethrin', context),
                    child('Augmentin', context),
                    child('Antinal', context),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 150,
                        child: Image.asset('assets/images/medication.jpg',
                            width: double.infinity),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InsuranceScreen(true)));
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Talk to a Doctor',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                    Expanded(
                      child: Container(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Doctors()));
                            },
                            child: Text(
                              'View All',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
                  child: GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 0.0,
                      children: List.generate(doctor.length, (index) {
                        return Center(
                          child: doctorCard(doctor: doctor[index]),
                        );
                      })),
                ),
              ],
            ),
          ),
        ));
  }

  Widget child(String txt, context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10),
      decoration: BoxDecoration(
          color: Color(0xeeeeedff), borderRadius: BorderRadius.circular(50)),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Products(Text: txt)));
        },
        child: Container(
          margin: EdgeInsets.all(10),
          child: Text(
            txt,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}

const List<Doctor> doctor = const <Doctor>[
  const Doctor(
      title: 'COVID-19', path: 'assets/images/covid.png', color: '#06428b'),
  const Doctor(
      title: 'Stomack',
      path: 'assets/images/stomachache.png',
      color: '#43b7ac'),
  const Doctor(
      title: 'Fever', path: 'assets/images/fever.png', color: '#e65b60'),
  const Doctor(
      title: 'Diarrhea', path: 'assets/images/diarrhea.png', color: '#8d93c3'),
  const Doctor(
      title: 'Sinus', path: 'assets/images/sinus.png', color: '#88214c'),
  const Doctor(
      title: 'Migraines', path: 'assets/images/headache.png', color: '#71d1fb'),
  const Doctor(title: 'Cold', path: 'assets/images/cold.png', color: '#89C271'),
  const Doctor(
      title: 'Acid Reflux', path: 'assets/images/Acid.png', color: '#686B8C'),
  const Doctor(
      title: 'Other', path: 'assets/images/other.png', color: '#FE7F25'),
];

class doctorCard extends StatelessWidget {
  const doctorCard({Key? key, this.doctor}) : super(key: key);
  final Doctor? doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: GestureDetector(
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  RequestScreen() ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: new LinearGradient(
                    stops: [0.07, 0.07],
                    colors: [HexColor('${doctor!.color}'), Colors.white],
                    end: const Alignment(0.0, 0.6),
                    begin: const Alignment(0.0, -1),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
//                              Icon(Icons.medication,
//                                size: 70,
//                                color: Colors.blue,
//                              ),
                    SizedBox(
                      height: 15,
                    ),
                    Image.asset(
                      '${doctor!.path}',
                      height: 40,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${doctor!.title}',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500
//                                    color: HexColor('#545566')
                          ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
