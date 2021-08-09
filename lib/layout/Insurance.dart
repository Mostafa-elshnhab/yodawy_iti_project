import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InsuranceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 15.0),
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
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 170.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(7)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image(
                              image: NetworkImage(
                                  'https://archive.org/download/metlife-new-logo-500/metlife-new-logo-500.jpg'),
                              width: 200.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: 170.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(7)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image(
                              image: NetworkImage(
                                  'https://www.stratumn.com/medias/32024-1600165209-logo-axa.jpg?lossless=true&auto=format&fm=webp,png&w=1460'),
                              width: 200.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 170.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(7)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image(
                              image: NetworkImage(
                                  'https://s3-eu-west-1.amazonaws.com/wuzzuf/files/company_logo/NEXtCARE-Egypt-23989-1625587858.png'),
                              width: 100.0,
                              height: 100.0,
                            ),
                          ),
                        ),
                        Container(
                          width: 170.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(7)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image(
                              image: NetworkImage(
                                  'https://csscf.b8cdn.com/120x120/images/logo/66/x1491866_logo_1576487345_n.png.pagespeed.ic.lygXrpNvfc.webp'),
                              width: 200.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 170.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(7)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image(
                              image: NetworkImage(
                                  'https://scontent-hbe1-1.xx.fbcdn.net/v/t1.6435-9/204018665_326063172428226_9185403464257846728_n.jpg?_nc_cat=109&ccb=1-4&_nc_sid=973b4a&_nc_ohc=qljqKlAoTEYAX-e6R8w&_nc_ht=scontent-hbe1-1.xx&oh=9153621d19e058c1870be84788d1d18b&oe=6137DB28'),
                              width: 200.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: 170.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(7)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image(
                              image: NetworkImage(
                                  'http://logok.org/wp-content/uploads/2015/03/Roche-logo-880x660.png'),
                              width: 200.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 170.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(7)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image(
                              image: NetworkImage(
                                  'https://s3-eu-west-1.amazonaws.com/wuzzuf/files/company_logo/Mediconsult-Egypt-13897.png'),
                              width: 200.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: 170.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(7)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image(
                              image: NetworkImage(
                                  'https://scontent-hbe1-1.xx.fbcdn.net/v/t1.6435-9/51590767_2370739323154908_6668983354735460352_n.png?_nc_cat=103&ccb=1-4&_nc_sid=973b4a&_nc_ohc=gbP26FsFjT8AX-YBxUW&_nc_ht=scontent-hbe1-1.xx&oh=ed0691781f07ee6705c68299cf292978&oe=6137D81A'),
                              width: 200.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//class InsuranceScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: ListView(
//        children: [
//          Padding(
//            padding: const EdgeInsets.only(top: 20.0, left: 15.0),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                Container(
//                    padding: const EdgeInsets.only(bottom: 5.0),
//                    child: Text(
//                      'Select your provider',
//                      style: TextStyle(
//                          fontSize: 20.0, fontWeight: FontWeight.bold),
//                    )),
//                SizedBox(
//                  height: 20,
//                ),
//                GridView.count(
//                    shrinkWrap: true,
//                    physics: NeverScrollableScrollPhysics(),
//                    crossAxisCount: 2,
//                    crossAxisSpacing: 12.0,
////                    mainAxisSpacing: 2,
//                    childAspectRatio: 1,
//                    children: List.generate(insurance.length, (index) {
//                      return Center(
//                        child: InsuranceCard(insurance: insurance[index]),
//                      );
//                    })),
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
//
//class Insurance {
//  const Insurance({this.path});
//  final String? path;
//}
//
//const List<Insurance> insurance = const <Insurance>[
//  const Insurance(
//      path:
//          'https://archive.org/download/metlife-new-logo-500/metlife-new-logo-500.jpg'),
//  const Insurance(
//      path:
//          'https://www.stratumn.com/medias/32024-1600165209-logo-axa.jpg?lossless=true&auto=format&fm=webp,png&w=1460'),
//  const Insurance(
//      path:
//          'https://s3-eu-west-1.amazonaws.com/wuzzuf/files/company_logo/NEXtCARE-Egypt-23989-1625587858.png'),
//  const Insurance(
//      path:
//          'https://csscf.b8cdn.com/120x120/images/logo/66/x1491866_logo_1576487345_n.png.pagespeed.ic.lygXrpNvfc.webp'),
//  const Insurance(
//      path:
//          'https://scontent-hbe1-1.xx.fbcdn.net/v/t1.6435-9/204018665_326063172428226_9185403464257846728_n.jpg?_nc_cat=109&ccb=1-4&_nc_sid=973b4a&_nc_ohc=qljqKlAoTEYAX-e6R8w&_nc_ht=scontent-hbe1-1.xx&oh=9153621d19e058c1870be84788d1d18b&oe=6137DB28'),
//  const Insurance(
//      path:
//          'http://logok.org/wp-content/uploads/2015/03/Roche-logo-880x660.png'),
//  const Insurance(
//      path:
//          'https://s3-eu-west-1.amazonaws.com/wuzzuf/files/company_logo/Mediconsult-Egypt-13897.png'),
//  const Insurance(
//      path:
//          'https://scontent-hbe1-1.xx.fbcdn.net/v/t1.6435-9/51590767_2370739323154908_6668983354735460352_n.png?_nc_cat=103&ccb=1-4&_nc_sid=973b4a&_nc_ohc=gbP26FsFjT8AX-YBxUW&_nc_ht=scontent-hbe1-1.xx&oh=ed0691781f07ee6705c68299cf292978&oe=6137D81A'),
//];
//
//class InsuranceCard extends StatelessWidget {
//  const InsuranceCard({Key? key, this.insurance}) : super(key: key);
//  final Insurance? insurance;
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      width: 170.0,
//      height: 150.0,
//      decoration: BoxDecoration(
//          border: Border.all(color: Colors.grey.shade300),
//          borderRadius: BorderRadius.circular(7)),
//      child: Padding(
//        padding: const EdgeInsets.all(20.0),
//        child: Image(
//          image: NetworkImage('${insurance!.path}'),
//          width: 200.0,
//          height: 200.0,
//          fit: BoxFit.cover,
//        ),
//      ),
//    );
//  }
//}
