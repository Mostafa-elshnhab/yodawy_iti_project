
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/layout/TalkToDoctor/questionScreen.dart';
import 'package:flutter_app_test/layout/TalkToDoctor/splachbody.dart';
import 'package:hexcolor/hexcolor.dart';

class RequestScreen extends StatefulWidget {

  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

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

                      Text('Request a Doctor\'s Call' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w600), ),
                      Text('Powered by estshara' , style: TextStyle(fontSize: 18  ,
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
                Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: Icon(

                    Icons.phone_in_talk ,size: 80,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  child:
                  Column(
                    children: [
                      Text('Please confirm that you are'
                        ,style: TextStyle(fontSize: 21 , fontWeight: FontWeight.w500 ),    ),
                      Text(' ready to get a call from an  ' ,
                        style: TextStyle(fontSize: 21 , fontWeight: FontWeight.w500 ), ),
                      Text(' estshara doctor ' ,
                        style: TextStyle(fontSize: 21 , fontWeight: FontWeight.w500 ),  ),
                    ],
                  ),
                ) ,
                SizedBox(height: 15,),
                GestureDetector(
                  child: Container(
                    child: Column(
                      children: [

                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Icon(
                              Icons.help_outline_outlined , color: Colors.blue,
                              size: 28,
                            ),
                            SizedBox(width: 12,) ,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start ,
                              children: [
                                Text('Frequently Asked Questions' ,
                                  style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 15),) ,
                                Text('Read some of the most frequently asked ' ,
                                  style: TextStyle(fontSize: 12 ,color: Colors.black38 ,height:1.5),),
                                Text('questions before talking to a doctor' ,
                                    style: TextStyle(fontSize: 12 ,color: Colors.black38 ,)),

                              ],
                            ),
                            SizedBox(width: 20,),
                            GestureDetector(
                              child: Icon(
                                Icons.arrow_forward_ios_outlined ,
                                color: Colors.orange,
                                size: 18,
                              ),
                              onTap: (){


                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => QuestionScreen()),
                                );




                              },
                            )
                          ],
                        ),

                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuestionScreen()),
                    );
                  } ,
                ) ,

                SizedBox(height: 80,),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('estshara' ,
                        style: TextStyle(fontWeight: FontWeight.bold , fontSize: 12),
                      ) ,
                      Text(' shall be solely responsible for any medical consultation' ,
                        style: TextStyle(fontSize: 10),)
                    ],
                  ),
                ) ,


                Container(
                  width: double.infinity ,
                  height: 45,
                  margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 7),

                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.orange
                      ),
                      //////////////////////////////////////////////////////////////////////
                      onPressed: (){


                        _showbuttonSheet( context ) ;

                      },
                      //////////////////////////////////////////////
                      child: Text('REQYEST A CALL' ,
                        style: TextStyle(fontWeight:FontWeight.w700 , fontSize: 16),)),
                ) ,



              ]
          ),
        ),
      ),
    );





  }

  _showbuttonSheet(context )
  {
    showModalBottomSheet(context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(35) ,
            topLeft: Radius.circular(35) ,

          ),

        ),
        backgroundColor: Colors.white,
        builder: (BuildContext context) {

          return Container(
            height: 250,
            width: double.infinity ,
            decoration: BoxDecoration(
              color: Colors.white ,

              borderRadius: BorderRadius.only(
                topRight: Radius.circular(35) ,
                topLeft: Radius.circular(35) ,

              ),),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,

                children: [
                  Icon(
                    Icons.phone_in_talk ,size: 70,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 10,),
                  Column(
                    children: [
                      Text('Please confirm that you are ready to ' ,
                        style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 16),),
                      Text('receive a call from the doctor now ?' ,
                          style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 16))
                    ],
                  ),
                  SizedBox(height: 25,),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Container(
                          height:40 ,
                          width: 130 ,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange) ,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),),

                          child: ElevatedButton(
                            child: const Text('Cancel' ,style: TextStyle(color: Colors.orange ,
                                fontWeight: FontWeight.w500),),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white ,

                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        SizedBox(width: 15,) ,

                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange),
                            borderRadius: BorderRadius.all(
                                Radius.circular(5.0)
                            ),),
                          height: 40,
                          width: 130,
                          child: ElevatedButton( onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  BodySplashScreen() ),
                            );

                          } ,
                              child: Text('Ready' ,
                                style: TextStyle(color: Colors.white , fontWeight: FontWeight.w500),) ,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orange ,

                              )


                          ),
                        ),
                      ],
                    ),
                  ) ,




                ],
              ),
            ),

          );
        });
  }

}
