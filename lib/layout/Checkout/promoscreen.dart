import 'package:flutter/material.dart';

class PromoScreen extends StatefulWidget {
  @override
  _PromoScreenState createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {
  var btncolor = Colors.grey;

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
                toolbarHeight: 50,
                // automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                leadingWidth: 35,
                leading: GestureDetector(
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                title: Container(
                    // width: double.infinity ,
                    child: Column(
                  children: [
                    Center(
                        child: Text(
                      'Promo Code',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: TextFormField(
                  style: TextStyle(color: Colors.blue),
                  onChanged: (index) {
                    if (index != null) {
                      print(index);
                      setState(() {
                        btncolor = Colors.orange;
                      });
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Add promo code',
                    focusColor: Colors.blue,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: btncolor,
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'ADD PROMO CODE',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Promo codes do not apply on :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 7, right: 10),
                          child: CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.black,
                          ),
                        ),
                        Text(
                          'Discounted products that are already on offer ',
                          style: TextStyle(
                              fontSize: 13, color: Colors.black38, height: 2),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 7, right: 10),
                          child: CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.black,
                          ),
                        ),
                        Text(
                          'Low Stock products ',
                          style: TextStyle(
                              fontSize: 13, color: Colors.black38, height: 2),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 7, right: 10),
                          child: CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.black,
                          ),
                        ),
                        Text(
                          'Medications ',
                          style: TextStyle(
                              fontSize: 13, color: Colors.black38, height: 2),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        // Text('.', style: TextStyle(fontWeight: FontWeight.bold , fontSize: 40),),
                        Padding(
                          padding: const EdgeInsets.only(top: 7, right: 10),
                          child: CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.black,
                          ),
                        ),
                        Text(
                          'Uploaded images ',
                          style: TextStyle(
                              fontSize: 13, color: Colors.black38, height: 2),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
