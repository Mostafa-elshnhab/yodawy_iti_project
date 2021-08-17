import 'package:flutter/material.dart';
  import 'package:flutter_app_test/layout/support/writeDetail.dart';
// import 'package:support/writeDetail.dart';

class HowCanScreen extends StatefulWidget {

  @override
  _HowCanScreenState createState() => _HowCanScreenState();
}

class _HowCanScreenState extends State<HowCanScreen> {
   var  bgColor1 = true ;
   var txtColor1 = true ;
   var  bgColor2 = true ;
   var txtColor2 = true ;
   var  bgColor3 = true ;
   var txtColor3 = true ;
   var  bgColor4 = true ;
   var txtColor4 = true ;
   var  bgColor5 = true ;
   var txtColor5 = true ;
   var  bgColor6 = true ;
   var txtColor6 = true ;
   var isShow = false ;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Container(
                       margin: EdgeInsets.only(top: 20 , left: 10),
                         child: GestureDetector(
                             child: Icon(Icons.arrow_back_ios_rounded ),
                           onTap: (){
                               Navigator.pop(context) ;

                           },
                         )
                     ) ,


                     Container(
                         margin: EdgeInsets.only(top: 20 , left: 10),
                         child: Text('How can we help?' ,
                           style: TextStyle(
                               fontWeight: FontWeight.w600 , fontSize: 21),)) ,



                     GestureDetector(
                       child: Center(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             SizedBox(height: 15,) ,
                             Container(
                               margin: EdgeInsets.symmetric(horizontal: 10),
                               width: double.infinity ,
                               height: 45,
                               decoration:  BoxDecoration(
                                  color: bgColor1? Colors.white : Colors.blue ,
                                   border: Border.all(color: Colors.black26),
                                   borderRadius: BorderRadius.circular(25)
                               ),
                               child: Center(
                                 child: Text('App is slow or is stuck on loading ' ,
                                   style: TextStyle(fontSize: 17 , color: txtColor1 ? Colors.black : Colors.white ),),
                               ),
                             ),
                           ],
                         ),
                       ),

                       onTap: (){
                         setState(() {

                               bgColor1 = false;
                               txtColor1 = false ;

                               bgColor2 = true ;
                               txtColor2 = true ;

                               bgColor3 = true ;
                               txtColor3 = true ;

                               bgColor4 = true ;
                               txtColor4 = true ;

                               bgColor5= true ;
                               txtColor5 = true ;

                               bgColor6 = true ;
                               txtColor6 = true ;

                                isShow=true ;

                         });

                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => WriteScreen()),
                         );

                       },
                     ) ,
                     GestureDetector(
                       child: Center(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             SizedBox(height: 15,) ,
                             Container(
                               margin: EdgeInsets.symmetric(horizontal: 10),
                               width: double.infinity ,
                               height: 45,
                               decoration:  BoxDecoration(
                                   color: bgColor2? Colors.white : Colors.blue  ,
                                 border: Border.all(color: Colors.black26),
                                 borderRadius: BorderRadius.circular(25)
                               ),
                               child: Center(
                                 child: Text('I can\'t find the product i want ' ,
                                   style: TextStyle(fontSize: 17 , color: txtColor2 ? Colors.black : Colors.white),),
                               ),
                             ),
                           ],
                         ),
                       ),

                       onTap: (){
                         setState(() {


                           bgColor1 = true;
                           txtColor1 = true ;

                           bgColor2 = false ;
                           txtColor2 = false ;

                           bgColor3 = true ;
                           txtColor3 = true ;

                           bgColor4 = true ;
                           txtColor4 = true ;

                           bgColor5= true ;
                           txtColor5 = true ;

                           bgColor6 = true ;
                           txtColor6 = true ;

                         });

                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => WriteScreen()),
                         );


                       },
                     ) ,


                     GestureDetector(
                       child: Center(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             SizedBox(height: 15,) ,
                             Container(
                               margin: EdgeInsets.symmetric(horizontal: 10),
                               width: double.infinity ,
                               height: 45,
                               decoration:  BoxDecoration(
                                   color: bgColor3 ? Colors.white : Colors.blue  ,
                                   border: Border.all(color: Colors.black26),
                                   borderRadius: BorderRadius.circular(25)
                               ),
                               child: Center(
                                 child: Text('Product price/info ate not correct' ,
                                   style: TextStyle(fontSize: 17 , color: txtColor3 ? Colors.black : Colors.white ),),
                               ),
                             ),
                           ],
                         ),
                       ),

                        onTap: (){
                        setState(() {
                          bgColor1 = true;
                          txtColor1 = true ;

                          bgColor2 = true ;
                          txtColor2 = true ;

                          bgColor3 = false ;
                          txtColor3 = false ;

                          bgColor4 = true ;
                          txtColor4 = true ;

                          bgColor5= true ;
                          txtColor5 = true ;

                          bgColor6 = true ;
                          txtColor6 = true ;

                        });

                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WriteScreen()),
                        );}
                     ) ,


                     GestureDetector(
                       child: Center(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             SizedBox(height: 15,) ,
                             Container(
                               margin: EdgeInsets.symmetric(horizontal: 10),
                               width: double.infinity ,
                               height: 45,
                               decoration:  BoxDecoration(
                                   color: bgColor4 ? Colors.white : Colors.blue  ,
                                   border: Border.all(color: Colors.black26),
                                   borderRadius: BorderRadius.circular(25)
                               ),
                               child: Center(
                                 child: Text('My promo code was not applied ' ,
                                   style: TextStyle(fontSize: 17 , color: txtColor4 ? Colors.black : Colors.white),),
                               ),
                             ),
                           ],
                         ),
                       ),
                        onTap: (){
                        setState(() {

                          bgColor1 = true;
                          txtColor1 = true;

                          bgColor2 = true ;
                          txtColor2 = true ;

                          bgColor3 = true ;
                          txtColor3 = true ;

                          bgColor4 = false;
                          txtColor4 = false ;

                          bgColor5= true ;
                          txtColor5 = true ;

                          bgColor6 = true ;
                          txtColor6 = true ;

                        });

                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WriteScreen()),
                        );}
                     ) ,


                     GestureDetector(
                       child: Center(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             SizedBox(height: 15,) ,
                             Container(
                               margin: EdgeInsets.symmetric(horizontal: 10),
                               width: double.infinity ,
                               height: 45,
                               decoration:  BoxDecoration(
                                   color: bgColor5 ? Colors.white : Colors.blue ,
                                   border: Border.all(color: Colors.black26),
                                   borderRadius: BorderRadius.circular(25)
                               ),
                               child: Center(
                                 child: Text('Unable to add my insurance card ' ,
                                   style: TextStyle(fontSize: 17 , color: txtColor5 ? Colors.black : Colors.white ),),
                               ),
                             ),
                           ],
                         ),
                       ),

                        onTap: (){
                        setState(() {
                          bgColor1 = true;
                          txtColor1 = true ;

                          bgColor2 = true ;
                          txtColor2 = true ;

                          bgColor3 = true ;
                          txtColor3 = true ;

                          bgColor4 = true ;
                          txtColor4 = true ;

                          bgColor5= false ;
                          txtColor5 = false ;

                          bgColor6 = true ;
                          txtColor6 = true ;

                        });

                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WriteScreen()),
                        );}
                     ) ,


                     GestureDetector(
                       child: Center(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             SizedBox(height: 15,) ,
                             Container(
                               margin: EdgeInsets.symmetric(horizontal: 10),
                               width: double.infinity ,
                               height: 45,
                               decoration:  BoxDecoration(
                                   color: bgColor6 ? Colors.white : Colors.blue ,
                                   border: Border.all(color: Colors.black26),
                                   borderRadius: BorderRadius.circular(25)
                               ),
                               child: Center(
                                 child: Text('other ' ,
                                   style: TextStyle(fontSize: 17 , color: txtColor6 ? Colors.black : Colors.white ),),
                               ),
                             ),
                           ],
                         ),
                       ),
                          onTap: (){
                          setState(() {
                            bgColor1 = true;
                            txtColor1 = true ;

                            bgColor2 = true ;
                            txtColor2 = true ;

                            bgColor3 = true ;
                            txtColor3 = true ;

                            bgColor4 = true ;
                            txtColor4 = true ;

                            bgColor5= true ;
                            txtColor5 = true ;

                            bgColor6 = false ;
                            txtColor6 = false ;
                          });

                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WriteScreen()),
                          );}
                     ) ,


                     (isShow) ?  Container(
                       width: double.infinity,
                         height: 70,
                       //  margin: EdgeInsets.symmetric(horizontal: 10),
                       child: Card(
                         elevation: 7,
                         child: Padding(
                           padding: const EdgeInsets.all(10),
                           child: ElevatedButton(
                               style: ElevatedButton.styleFrom(
                                   primary: Colors.orange
                               ),
                               //////////////////////////////////////////////////////////////////////
                               onPressed: (){

                                 Navigator.push(
                                   context,
                                   MaterialPageRoute(builder: (context) => WriteScreen()),
                                 );

                               },
                               //////////////////////////////////////////////
                               child: Text('NEXT ' ,
                                 style: TextStyle(fontWeight:FontWeight.w700 , fontSize: 16),)),
                         ),
                       ),
                     ) : SizedBox(height: 50,) ,

                   ],
                ),
              ),
            ),
          ),

    );
  }
}
