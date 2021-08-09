import 'package:flutter/material.dart';

class InsuranceNotLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.login_outlined,
                    size: 100,
                    color: Colors.white,
                  ),
                  Text(
                    'Log in to add your insurance card and',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    ' order your medication ',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        'LOG IN',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      minWidth: double.infinity,
                      height: 50,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    )
//        child: Center(
//          child: IconButton(
//            onPressed: () {},
//            icon: Icon(
//              Icons.login_outlined,
//              size: 80,
//              color: Colors.white,
//            ),
//          ),
//        ),

        );
  }
}
