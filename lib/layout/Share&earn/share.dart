import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareEarn extends StatefulWidget {
  const ShareEarn({Key? key}) : super(key: key);

  @override
  _ShareEarnState createState() => _ShareEarnState();
}

class _ShareEarnState extends State<ShareEarn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 80,
                  width: 50,
                  child: GestureDetector(
                      child: Icon(Icons.arrow_back_ios),
                      onTap: () {
                        Navigator.pop(context);
                      })),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  'Share Yodawy & Get Vouchers',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                    'Invite your friends to use Yodawy. '
                    'They get EGP50 discount on their first order!'
                    'You get EGP30 when they place that first order.',
                    style: TextStyle(
                        color: Colors.black38, fontSize: 20, height: 1.3)),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Image(
                        image: AssetImage('assets/images/share.jpeg'),
                        fit: BoxFit.cover),
                    //color: Colors.black38,
                    width: MediaQuery.of(context).size.width),
              ),
              Container(
                  width: MediaQuery.of(context).size.width - 30,
                  margin: EdgeInsets.only(bottom: 10, left: 15),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextButton(
                    onPressed: () {
                      print('invite');
                      Share.share(
                          'Tap on this link to install the Yodawy app and get EGP50 off on your first order (valid for 48 Hours),https://yodawy.app.link/1IujexMHbjb');
                    },
                    child: Text(
                      'INVITE FRIENDS',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )),
            ]));
  }
}
