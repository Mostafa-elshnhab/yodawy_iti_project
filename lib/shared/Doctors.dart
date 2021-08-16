import 'package:flutter/material.dart';
import 'package:flutter_app_test/layout/TalkToDoctor/requestScreen.dart';
import 'package:flutter_app_test/models/Doctors_models.dart';
import 'package:hexcolor/hexcolor.dart';

class Doctors extends StatefulWidget {
  @override
  _DoctorsState createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Container(
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
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leadingWidth: 30,
            centerTitle: true,
            title: Text(
              'Choose a Symptom',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Request an instant call whit a doctor'),
              SizedBox(
                height: 3,
              ),
              Text(
                'it\'s Free!',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
                child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    childAspectRatio: 1.2,
                    children: List.generate(doctor.length, (index) {
                      return Center(
                        child: doctorCard(doctor: doctor[index]),
                      );
                    })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RequestScreen()));
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
                      height: 20,
                    ),
                    Image.asset(
                      '${doctor!.path}',
                      height: 45,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${doctor!.title}',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900
//                                    color: HexColor('#545566')
                          ),
                    ),
                    SizedBox(
                      height: 18,
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
