
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class UploadCard extends StatefulWidget {
  const UploadCard({Key? key}) : super(key: key);

  @override
  _UploadCardState createState() => _UploadCardState();
}

class _UploadCardState extends State<UploadCard> {

  Color btnColor = Colors.blue;

  File? cardImage;
  Future pickImage(ImageSource source) async {
    try {
      final camImage = await ImagePicker().pickImage(source: source);
      if (camImage == null) return;

      final imageTemp = File(camImage.path);
      setState(() {
        this.cardImage = imageTemp;
      });
    } on PlatformException catch (e) {
      print('Failed To Pick An Image: $e');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leadingWidth: 30,
                centerTitle: true,
                title: Text(
                  'Upload Card',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return Container(
                        color:
                        Color(0xFF737373),
                        child: Container(
                          decoration:
                          BoxDecoration(
                            color:
                            Colors.white,
                            borderRadius:
                            BorderRadius
                                .only(
                              topRight: Radius
                                  .circular(
                                  20.0),
                              topLeft: Radius
                                  .circular(
                                  20.0),
                            ),
                          ),
                          child: Wrap(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets
                                    .all(
                                    20.0),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .center,
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsets.all(10.0),
                                      child:
                                      Text(
                                        'Upload Prescription',
                                        style:
                                        TextStyle(
                                          color:
                                          Colors.grey,
                                          fontSize:
                                          20.0,
                                          fontWeight:
                                          FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                      15.0,
                                    ),
                                    Container(
                                      height:
                                      1.0,
                                      color: Colors
                                          .black12,
                                    ),
                                    SizedBox(
                                      height:
                                      15.0,
                                    ),
                                    GestureDetector(
                                      onTap:
                                          () {
                                        pickImage(
                                            ImageSource.camera);
                                      },
                                      child:
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.camera_alt,
                                            color: Colors.orange,
                                            size: 25.0,
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                            'Camera',
                                            style: TextStyle(
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                      15.0,
                                    ),
                                    Container(
                                      height:
                                      1.0,
                                      color: Colors
                                          .black12,
                                    ),
                                    SizedBox(
                                      height:
                                      15.0,
                                    ),
                                    GestureDetector(
                                      onTap:
                                          () {
                                        pickImage(
                                            ImageSource.gallery);
                                      },
                                      child:
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.image,
                                            color: Colors.orange,
                                            size: 25.0,
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                            'Gallery',
                                            style: TextStyle(
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                      30.0,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child:
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(5.0),
                                              border: Border.all(
                                                color: Colors.orange,
                                              ),
                                            ),
                                            child: MaterialButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              elevation: 0.0,
                                              textColor: Colors.orange,
                                              child: Text(
                                                'CANCEL',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 18.0,
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
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Container(
                width: double.infinity,
                height: 200.0,
                child: (cardImage == null) ? DottedBorder(
                  dashPattern: [6, 0, 2, 3],
                  color: Colors.blue,
                    borderType: BorderType.Rect,
                    strokeWidth: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                              Icons.credit_card,
                            color: Colors.blue,
                            size: 40.0,
                          ),
                          SizedBox(height: 5.0,),
                          Text(
                              'Upload Insurance Card',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.blue,
                              decoration: TextDecoration.underline
                            ),
                          ),
                        ],
                      ),
                    ),
                ) : Image.file(cardImage! , fit: BoxFit.cover,),
              ),
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
                        if(cardImage == null)
                        {
                          return;
                        }
                        else{
                          // setState(() {
                          //   btnColor = Colors.blue;
                          // });
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => UploadCard()));UploadCard
                        }

                      },
                      elevation: 0.0,
                      textColor: Colors.white,
                      child: Text(
                        'Save Card',
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
