import 'package:flutter/material.dart';

class PrescriptionsDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
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
                 toolbarHeight: 70 ,
                // automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,

                 automaticallyImplyLeading: false,

                title: GestureDetector(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start ,
                    crossAxisAlignment: CrossAxisAlignment.start ,
                    children: [
                      SizedBox(height: 15,),
                      Icon(
                        Icons.arrow_back_ios_rounded,
                      ),
                     SizedBox(height: 12,),
                    Text(
                      '  e-Prescriptions Details',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    ],
                  ),
                 onTap: () {
                   Navigator.pop(context);
                 },
                ),

              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                height: 70,
                width: double.infinity ,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(width: 1 , color: Colors.black12 ,) ,

                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start ,
                    crossAxisAlignment: CrossAxisAlignment.start ,
                    children: [

                      Text(' Dr. Dr. Sara Mohamed Elsayed ' ,
                        style: TextStyle( height: 1.3 , fontSize: 17 , fontWeight: FontWeight.bold),),

                      Text(' 09 August 2021, 02:16 PM' , style: TextStyle(color: Colors.grey),)

                    ],
                  ),
                ),
              )),

            // SizedBox(height: 3,),

            Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 70,
                  width: double.infinity ,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(width: 1 , color: Colors.black12  ,) ,

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start ,
                      crossAxisAlignment: CrossAxisAlignment.start ,
                      children: [

                        Text(' Attached Note' ,
                          style: TextStyle( height: 1.3 , fontSize: 15 , fontWeight: FontWeight.bold),),

                        Text(' Application trial' , style: TextStyle(color: Colors.grey),)

                      ],
                    ),
                  ),
                )),



          ],
        ),
      ),
    );
  }
}
