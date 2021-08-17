import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/layout/login.dart';

class WriteScreen extends StatefulWidget {

  @override
  _WriteScreenState createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {

   Color btnSubmit = Colors.grey ;
   var textController = TextEditingController();

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
                    },)) ,
                Container(
                    margin: EdgeInsets.only(top: 20 , left: 10),
                    child: Text('Please add any relevant details' ,
                      style: TextStyle(
                          fontWeight: FontWeight.w600 , fontSize: 21),)) ,

                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 15,) ,
                      /*Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: double.infinity ,
                        height: 70,
                        decoration:  BoxDecoration(
                            border: Border.all(color: Colors.black26),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextFormField(

                        )
                      ),*/

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: double.infinity,
                        height: 100,
                        child: TextFormField(
                          controller: textController ,
                          onChanged: (value){
                             setState(() {
                               if(textController.value.text.length ==0 )
                                 {
                                   btnSubmit= Colors.grey ;
                                 }
                               else
                                 {
                                   btnSubmit= Colors.orange ;
                                 }

                             });
                          },
                            maxLines: 20,

                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26),
                            ),
                            border: OutlineInputBorder(
                               borderSide: BorderSide(
                                 color: Colors.grey
                               ),
                              borderRadius: BorderRadius.circular(5)


                            )
                            )
                          ),

                        ),

                      Container(

                        width: double.infinity ,
                        height: 45,
                        margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 25),

                        child:ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: btnSubmit
                            ),
                            //////////////////////////////////////////////////////////////////////
                            onPressed: (){


                            Navigator.push(
                              context,
                               MaterialPageRoute(builder: (context) => LoginScreen() ),
                             );

                            },
                            //////////////////////////////////////////////
                            child: Text('SUBMIT' ,
                              style: TextStyle(fontWeight:FontWeight.w700 , fontSize: 16),)),


                      )

                    ],
                  ),
                ) ,





              ],
            ),
          ),
        ),
      ),

    );
  }
}
