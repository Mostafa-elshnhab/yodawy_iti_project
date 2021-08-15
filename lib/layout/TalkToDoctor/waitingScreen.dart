import 'package:flutter/material.dart';

class WaitScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:

      PreferredSize(
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
          margin: EdgeInsets.only(top: 90),
          child: Center(
            child: Column(
              children: [
                Icon(Icons.timer , size: 70, color: Colors.blue,) ,
                SizedBox(height: 20,) ,
                Text('You will receive a call shortly so' ,
                  style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 16),) ,
                Text('please keep your phone close by' ,
                    style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 16 , height: 1.5) ) ,
                SizedBox(height: 100 ,),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20 ),
                  height: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.orange
                      ),
                      ///////////////////////////////////////
                      onPressed: (){


                      },
                      //////////////////////////////////////////////
                      child: Text('ok' ,
                        style: TextStyle(fontWeight:FontWeight.w700 , fontSize: 16),)),
                )
              ],
            ),
          ),

        ),
      ),

    );
  }
}
