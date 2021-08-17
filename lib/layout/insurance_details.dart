
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/models/insurance_card_details.dart';

class InsuranceDetails extends StatelessWidget {
  final InsuranceCardDetails? card;

  const InsuranceDetails(
      {Key? key , this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                    '${card!.insuranceImg}',
                  height: 100.0,
                  width: 100.0,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        'Card No',
                         textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        maxLength: 2,
                        decoration: InputDecoration(
                          hintText: '12',
                            counter: SizedBox.shrink(),
                        ),
                      ),
                    ),
                    Text(
                        '/',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        maxLength: 2,
                        decoration: InputDecoration(
                          hintText: 'AB',
                            counter: SizedBox.shrink()
                        ),
                      ),
                    ),
                    Text(
                      '/',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        maxLength: 5,
                        decoration: InputDecoration(
                          hintText: '12345',
                            counter: SizedBox.shrink()
                        ),
                      ),
                    ),
                    Text(
                      '/',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Expanded(
                      child: TextFormField(
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '1',
                            counter: SizedBox.shrink()
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        showModalBottomSheet(context: context,
                            isScrollControlled: true,
                            builder: (context){
                              return Wrap(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Policy No:',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: (){
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(
                                                Icons.close,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'You can find it on the front of your card.',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.0,),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          child: Image.asset(
                                            '${card!.cardNumberImg}',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Icon(
                        Icons.error,
                          size: 25.0,
                          color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child:
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Colors.blue,
                      ),
                    ),
                    child: MaterialButton(
                      onPressed: () {

                      },
                      elevation: 0.0,
                      textColor: Colors.white,
                      child: Text(
                        'Next',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
