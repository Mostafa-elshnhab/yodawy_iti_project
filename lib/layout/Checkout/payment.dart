import 'package:flutter/material.dart';
import 'package:flutter_app_test/layout/Checkout/promoscreen.dart';

bool iscash = true;

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

enum SingingCharacter { Cash, Credit }

class _PaymentState extends State<Payment> {
  SingingCharacter? _character = SingingCharacter.Cash;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Promo code',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PromoScreen()));
                  },
                  child: Text(
                    'Tab to add promo code',
                    style: TextStyle(color: Colors.grey),
                  )),
              SizedBox(
                height: 20.0,
              ),
              RadioListTile<SingingCharacter>(
                title: Row(
                  children: [
                    Icon(
                      Icons.money,
                      size: 30.0,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    const Text(
                      'Cash',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
                value: SingingCharacter.Cash,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                    iscash = true;
                  });
                },
              ),
              RadioListTile<SingingCharacter>(
                title: Row(
                  children: [
                    Icon(
                      Icons.credit_card,
                      size: 30.0,
                      color: Colors.blue[600],
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    const Text(
                      'Credit Card Machine',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
                value: SingingCharacter.Credit,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                    iscash = false;
                  });
                },
              ),
            ],
          ),
//          Container(
//            margin: EdgeInsets.all(20),
//            width: MediaQuery.of(context).size.width,
//            height: 50,
//            decoration: BoxDecoration(
//              borderRadius: BorderRadius.circular(5),
//              color: Colors.orange,
//            ),
//            child: TextButton(
//              child: Text('CONFIRM PAYMENT METHOD',
//                style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 20
//                ),),
//              onPressed: (){
//                Navigator.push(context, MaterialPageRoute(builder: (context) => Confirmation()));
//              },
//            ),
//          ),
        ],
      ),
    );
  }
}
