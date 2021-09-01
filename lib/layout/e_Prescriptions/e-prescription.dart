import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'e-prescriptiondetail.dart';

class Prescriptions extends StatelessWidget {
  const Prescriptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
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
          child: Column(
            children: [
              AppBar(
                toolbarHeight: 50,
                // automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                leadingWidth: 35,
                leading: GestureDetector(
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                title: Container(
                    // width: double.infinity ,
                    child: Column(
                  children: [
                    Center(
                        child: Text(
                      'e-Prescriptions',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                width: 1,
                color: Colors.black12,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'August 2021',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.orange),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    ' Dr. Dr. Sara Mohamed Elsayed ',
                    style: TextStyle(height: 1.5, fontSize: 13),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('hi');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrescriptionsDetail()),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          'Application trial',
                          style: TextStyle(color: Colors.blue),
                        ),
                        SizedBox(
                          width: 150,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.orange,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Monday, 09 August 2021, 02:16 PM',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
