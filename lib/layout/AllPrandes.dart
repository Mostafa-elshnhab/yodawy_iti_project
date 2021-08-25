import 'package:flutter/material.dart';
import 'package:flutter_app_test/Data/Api/Brands/allbrandsApi.dart';
import 'package:flutter_app_test/shared/components.dart';

class AllPrands extends StatefulWidget {
  @override
  _AllPrandsState createState() => _AllPrandsState();
}

class _AllPrandsState extends State<AllPrands> {
  @override
  void initState() {
    super.initState();
    getbrandDataFB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarBuilder('Prands', context),
        body: FutureBuilder<List>(
            future: getbrandDataFB(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GridView.count(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 12.0,
                            mainAxisSpacing: 0.0,
//                    childAspectRatio: 1.5,
                            children:
                                List.generate(snapshot.data!.length, (index) {
                              String path = snapshot.data![index]['path'];
                              return Center(
                                child: GestureDetector(
                                  onTap: () {
                                    //        Navigator.push(
                                    //            context,
                                    //            MaterialPageRoute(
                                    //                builder: (context) => Products(Text: prands!.titel)));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 130,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(
                                        child: Image.network(
                                          '$path',
                                          width: 40,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            })),
                      ],
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Expanded(
                  child: new Container(
                    color: Colors.grey.shade200.withOpacity(0.8),
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Center(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Ooooops Network Error!",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: "Cairo1",
                                  fontSize: 40.0),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
              return Expanded(
                child: Center(
                  child: Container(
                      color: Colors.grey.withOpacity(.8),
                      child: Image.asset('assets/images/1.jpg')),
                ),
              );
            }));
  }
}
