import 'package:flutter/material.dart';

class MyOrderScreen extends StatefulWidget {

  @override
  _MyOrderScreenState createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
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
                toolbarHeight: 50 ,
               //  automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                leadingWidth: 15 ,

                leading:

                GestureDetector(

                  child: Icon(
                    Icons.arrow_back_ios_rounded ,
                  ),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),


                title: Container(
                  // width: double.infinity ,
                    child: Column(
                      children: [
                        Center(child: Text('My Orders' , style: TextStyle(fontWeight: FontWeight.bold),)),

                      ],
                    )

                ),

              ),



            ],
          ),
        ),
      ),


      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 90),
          child: Center(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [

                    Container(
                      margin: EdgeInsets.only(top: 13),
                      child: Text('!' , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold ,
                          color: Color.fromRGBO(24, 158, 204, 1)),),
                    ),
                    Icon(Icons.shopping_bag_outlined , size: 70, color: Color.fromRGBO(24, 158, 204, 1) ,),
                  ],
                ) ,
                SizedBox(height: 20,) ,
                Text('No Previous Orders ' ,
                  style: TextStyle( fontWeight: FontWeight.w600 , fontSize: 18),) ,
                Text('All your previous orders will be ' ,
                    style: TextStyle(color: Colors.black45 , fontSize: 16 , height: 1.5) ) ,
                Text('display here' , style: TextStyle( color: Colors.black45 , fontSize: 16 , height: 1.5) ),
                SizedBox(height: 180 ,),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20 ),
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.orange
                      ),
                      ///////////////////////////////////////
                      onPressed: (){
                         Navigator.pop(context);

                      },
                      //////////////////////////////////////////////
                      child: Text('START ORDERING' ,
                        style: TextStyle(fontWeight:FontWeight.w700 , fontSize: 19 ),)),
                )
              ],
            ),
          ),

        ),
      ),
    );
  }
}
