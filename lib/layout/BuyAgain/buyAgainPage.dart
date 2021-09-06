import 'package:flutter/material.dart';

class BuyAgain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(106.0),
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
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leadingWidth: 30,
                  centerTitle: true,
                  title: Text(
                    'Buy Again',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                TabBar(
                    indicatorColor: Colors.white,
                    indicatorWeight: 4,
                    labelStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    tabs: [
                      Tab(
                        text: "Medications",
                      ),
                      Tab(
                        text: "Everything Else",
                      )
                    ]),
              ],
            ),
          ),
        ),
        body: TabBarView(children: [
          Medica(),
          Evrything(),
        ]),
      ),
    );
  }
}

class Medica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
              child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Icon(
                            Icons.shopping_bag_outlined,
                            size: 120,
                            color: Colors.blue,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Center(
                              child: Text(
                                '!',
                                style:
                                    TextStyle(fontSize: 50, color: Colors.blue),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'No Medication Ordered',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Once you order Medication, you will ba able to ',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'easily reorder them from here',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
        ),
      ],
    );
  }
}

class Evrything extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
              child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Icon(
                            Icons.shopping_bag_outlined,
                            size: 120,
                            color: Colors.blue,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Center(
                              child: Text(
                                '!',
                                style:
                                    TextStyle(fontSize: 50, color: Colors.blue),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'No Products Ordered',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Once you order Products, you will ba able to ',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'easily reorder them from here',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
        ),
      ],
    );
  }
}
