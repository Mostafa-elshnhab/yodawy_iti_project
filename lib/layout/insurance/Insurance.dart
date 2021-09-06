import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/Data/Users/userData.dart';
import 'insurance_details.dart';
import 'package:flutter_app_test/models/insurance_card.dart';
import 'package:flutter_app_test/shared/Drower.dart';

class InsuranceScreen extends StatelessWidget {
  bool view = false;
  InsuranceScreen(this.view);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: !view ? createDrawer(context, Usres.name) : null,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
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
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leadingWidth: 30,
            centerTitle: true,
            title: Text(
              'Insurance Companies',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      'Select your provider',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 20,
                ),
                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 180,
                        childAspectRatio: 16 / 14,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12),
                    itemCount: card.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InsuranceDetails(
                                      card: card[index].cardDetailsModel,
                                    )),
                          );
                        },
                        child: Container(
                          height: 150.0,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image(
                              image: NetworkImage('${card[index].imgPath}'),
                              width: 200.0,
                              height: 200.0,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
