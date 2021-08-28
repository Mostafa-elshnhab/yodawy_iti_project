import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'upload_insurance_card.dart';


class InsuranceHolderName extends StatefulWidget {

  final String? insuranceImg;
  const InsuranceHolderName({Key? key, this.insuranceImg}) : super(key: key);

  @override
  _InsuranceHolderNameState createState() => _InsuranceHolderNameState();
}

class _InsuranceHolderNameState extends State<InsuranceHolderName> {
  @override
  Widget build(BuildContext context) {
    TextEditingController holderName = TextEditingController();
    Color btnColor = Colors.blue;
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Details'),
        centerTitle: true,
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
                  '${widget.insuranceImg}',
                  height: 100.0,
                  width: 100.0,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Card Holder\'s Name',
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
                        controller: holderName,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Name',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: btnColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        if(holderName.value.text.isEmpty)
                          {
                            return;
                          }
                        else{
                          // setState(() {
                          //   btnColor = Colors.blue;
                          // });
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UploadCard()));
                        }

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
