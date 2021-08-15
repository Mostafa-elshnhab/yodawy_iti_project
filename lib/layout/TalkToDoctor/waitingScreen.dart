import 'package:flutter/material.dart';

class WaitScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Container(

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
              SizedBox(height: 15,) ,

              Text('Request a Doctor\'s Call' , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.w600), ),
              Text('Powered by estshara' , style: TextStyle(fontSize: 16  ,
              ), ),
            ],
          ),
        ),
         automaticallyImplyLeading: false,






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
