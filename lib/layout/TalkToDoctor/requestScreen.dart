
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/layout/TalkToDoctor/questionScreen.dart';
import 'package:flutter_app_test/layout/TalkToDoctor/splachbody.dart';

class RequestScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
           // backgroundColor: Colors.redAccent,
          title: Container(

            child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,

               children: [
                 GestureDetector(
                   child: Icon(
                      Icons.arrow_back_ios_rounded ,
                        ),
                   onTap: (){
                   //  print('hi');
                   },
                 ),
                SizedBox(height: 15,) ,

                Text('Request a Doctor\'s Call' , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.w600), ),
                Text('Powered by estshara' , style: TextStyle(fontSize: 16  ,
                     ), ),
              ],
            ),
          ),
          automaticallyImplyLeading: false,



        ),

        body: Column(
          children: [

            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    child: Icon(

                      Icons.phone_in_talk ,size: 80,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10,),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround ,
                            children: [
                              // SizedBox(width: 10,),
                              Icon(
                                Icons.help_outline_outlined , color: Colors.blue,
                                size: 28,
                              ),
                              //  SizedBox(width: 12,) ,
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
                              //  SizedBox(width: 20,),
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
               ],
              ),
            ),


            // SizedBox(height: 80,),


         Column(

           children: [
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
                   ///////////////////////////////////////
                   onPressed: (){

                     //  showAlertDialog(context);

                     showModalBottomSheet<void>(
                       context: context,
                       isScrollControlled: true,

                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.only(
                             topLeft: const Radius.circular(30.0),
                             topRight: const Radius.circular(30.0),


                           )
                         //  borderRadius: BorderRadius.circular(30.0),
                       ),

                       builder: (BuildContext context) {
                         return FractionallySizedBox(
                             heightFactor: 0.4,
                             child: Center(
                               child: Container(
                                 height: 185 ,
                                 color: Colors.white ,
                                 child: Center(
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     mainAxisSize: MainAxisSize.min,

                                     children: <Widget>[
                                       const Icon(

                                         Icons.phone_in_talk ,size: 80,
                                         color: Colors.blue,
                                       ),

                                       Column(
                                         children: [
                                           Text('Please confirm that you are ready to ' ,
                                             style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 16),),
                                           Text('receive a call from the doctor now ?' ,
                                               style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 16))
                                         ],
                                       ),
                                       SizedBox(height: 20,),

                                       Container(
                                         margin: EdgeInsets.symmetric(horizontal: 20),

                                         child: Center(

                                           child: SingleChildScrollView(
                                             child: Row(
                                               children: [
                                                 Expanded(
                                                   child: Container(

                                                     height:40 ,
                                                        // width: 100 ,
                                                     decoration: BoxDecoration(
                                                       //   border: Border.all(color: Colors.orange) ,
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
                                                 ),
                                                 SizedBox(width: 10,) ,

                                                 Expanded(
                                                   child: Container(
                                                     decoration: BoxDecoration(
                                                       //   border: Border.all(color: Colors.orange),
                                                       borderRadius: BorderRadius.all(
                                                           Radius.circular(5.0)
                                                       ),),
                                                     height: 40,
                                                     // width: 100,
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
                                                 ),
                                               ],
                                             ),
                                           ),
                                         ),
                                       ) ,

                                     ],
                                   ),
                                 ),),
                             ));
                       },
                     );





                   },
                   //////////////////////////////////////////////
                   child: Text('REQUEST A CALL' ,
                     style: TextStyle(fontWeight:FontWeight.w700 , fontSize: 16),)),
             ) ,
             SizedBox(height: 20,)
           ],
         ),





          ]
           ),
           );









                         }
                         /////////////////////////////////////////////////////
  ///////////////////////////////////////////

  /*showAlertDialog(BuildContext context) {


    Widget cancelButton =Container(
      width: 100 ,
        child : ElevatedButton( onPressed: (){} ,
        child: Text('Cancel' , style: TextStyle(color: Colors.orange),) ,
        style: ElevatedButton.styleFrom(
        primary: Colors.white ,

    ),) ) ;



    Widget continueButton = Container(
      width: 100 ,
   child : ElevatedButton( onPressed: (){} ,
        child: Text('Ready') ,
      style: ElevatedButton.styleFrom(
          primary: Colors.orange
      ),

    ) ) ;


    // set up the AlertDialog
    AlertDialog alert =  AlertDialog(


      title: Icon(  Icons.phone_in_talk ,size: 60,
        color: Colors.blue, ),
      content: Text("Please confirm that you are ready to receive a call from the doctor now?") ,
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(

      context: context,
      builder: (BuildContext context) {

        return alert;
      },
    );
  } */





  //////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////





                       }
