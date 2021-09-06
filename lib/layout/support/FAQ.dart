import 'package:flutter/material.dart';
import 'package:flutter_app_test/layout/TalkToDoctor/accordion.dart';

class FaqScreen extends StatefulWidget {
  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  var email =
      () => {TextButton(onPressed: () {}, child: Text('sara@gmail.com'))};
  //TextButton(onPressed: (){}, child: Text('sara@gmail.com'));

  bool _showContent = false;

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
                //  automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                leadingWidth: 15,

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
                      'FAQ',
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
          child: Column(children: [
            Accordion(
                'Why is ordering online Yodawy easier than calling the pharmacy?',
                'Yodawy makes it easier for you to explore, find, and conveniently purchase medications and well-being products at a tap of a button. '
                    '\n'
                    '\n'
                    'You will also discover and benefit from unbeatable offers and discounts on a wide variety of items.'
                    '\n'
                    '\n'
                    'Easily track your orders. Save your favorite items. Reorder items you frequently need. And much, much more'),
            Accordion(
                'I have a prescription from the doctor .Can I still order from Yodawy?',
                'Absolutely! You can easily scan and upload your prescription in the Yodawy app. And we\'ll handle the rest and deliver your medications to your address.'),
            Accordion(
                'Can I use my health insurance if I am ordering from Yodawy?',
                'Yes, you can! Choose your insurance company from the Yodawy app, add your insurance card number, and start ordering your medications right away.'),
            Accordion('Is it safe to order medications from Yodawy?',
                'Yodawy only partners with licensed pharmacies. Additionally, Yodawy only offers products and medications that are registered with the Ministry of Health. And your order will be safely delivered and invoiced exclusively through these licensed pharmacies.'),
            Accordion('What areas do you currently cover?',
                'Yodawy is available and delivers services in all governorates in Egypt.'),
            Accordion('How much does Yodawy charge for delivery?',
                'Yodawy delivery fees range from "free delivery" to EGP 15 unless stated otherwise on specific products.'),
            Accordion('How do I place an order with a promo code?',
                'After adding the items to your cart, and prior to confirming your order, you will be able to input the promo code to claim your discount.'),
            Accordion(
                'Can I use a promo code on medication products?',
                'Promo codes do not apply on medications. Moreover, promo codes do not apply on \'Low Stock\' products, products that are already on \'offer\' or uploaded  images.'
                    ' \n '
                    '\n'
                    '\n'
                    'Also, note that promo codes may only be used once (unless specified otherwise), are valid for a limited period, and may not be applicable in certain regions.'
                    ' \n '
                    '\n'
                    '\n'
                    'Finally, if you cancel your order, do not worry! Your promo code will not expire and can still be redeemed on a new order'),
            Accordion('Is it possible to order through the phone or Facebook?',
                'Unfortunately, you can only order through the app. This allows you to easily find the products you need, discover if they\'re on discount, track your order, and reorder your frequent needs.'),
            Accordion('How can I partner with Yodawy?',
                'Please email us at hello@yodawy.com'),
            Accordion('Can I join the Yodawy team?',
                ' We\'re always looking for the best talent out there. Please reach out at hello@yodawy.com'),
          ]),
        ),
      ),
    );
  }
}
