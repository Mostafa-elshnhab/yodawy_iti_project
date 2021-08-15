import 'package:flutter/material.dart';
import 'dart:async';


import 'accordion.dart';



class QuestionScreen extends StatefulWidget {

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override

  /*void initState() {

    Timer(Duration(seconds:1),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    BodySplashScreen()

              //  BodySplashScreen()
              //   Scaffold()




            )
        )
    );
  }*/


  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(125.0),
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
                toolbarHeight: 100 ,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                //leadingWidth: 30,
                title: Container(
                  width: double.infinity ,
                  // height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.arrow_back_ios_rounded ,
                        ),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(height: 10,) ,

                      Text('Frequently asked questions' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w600), ),
                      Text('Some questions that will help you' , style: TextStyle(fontSize: 18  ,
                      ), ),
                    ],
                  ),

                ),

              ),

            ],
          ),
        ),
      ),


      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Accordion('Is Esteshara certified from the ministry of health?',
                  'All the doctors of estshara are certified from'
                      'the ministry of health .'),
              Accordion('Can you provide sick notes and Prescriptions after the phone consultation?',
                  'Estshara\' doctor will send you a recommendation '
                      'after the consultations'),

              Accordion('What are the symptoms that Esteshara\' doctors deal with?',
                  'For cold , flu , cough , irritation , nausea ,fever , sinuses ,'
                      'some skin conditions, men and women health '),
              Accordion('What are the available Specialties?', 'Family medicine and internal medicine ,'),

              Accordion('What you help with Esteshara in emergency '
                  'cases?',
                  'No , We cannot use Esteshara in emergency cases , '
                      'You can refer to the ambulance or emergency spots'),
              Accordion('is there a place that we can visit ?', 'You can consult estshara\'doctors through'
                  'the application only .') ,

              Accordion('Are there doctors available to answer the consultation ? And are they qualified?',
                  'Estshara doctors are online and ready to answer the consultations 24/7.'
                      'All estshara\'doctors hold at least a master\'degree and holding an operating license '
                      'from the ministry of health.'
                      'And to deal in remote medical consultations.') ,

              Accordion('Can you help with sending the medicines needed after consultation?' ,
                  'You can order the needed medicine after consultation from Yodawy.' )
            ],
          ),

        ),
      ),












    );
  }
}
