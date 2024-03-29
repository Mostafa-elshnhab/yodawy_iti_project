import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_test/Data/Api/Brands/BrandHomFutBulder.dart';
import 'package:flutter_app_test/Data/Api/Brands/allbrandsApi.dart';
import 'package:flutter_app_test/Data/Api/Category/CtegoryFuterBuilder.dart';
import 'package:flutter_app_test/Data/Api/Category/categoryApi.dart';
import 'package:flutter_app_test/Data/Users/userData.dart';
import 'package:flutter_app_test/notification/notificationservice.dart';
import '../insurance/insurance_details.dart';
import 'package:flutter_app_test/models/insurance_card.dart';
import 'package:flutter_app_test/modules/offers/offers.dart';
import 'package:flutter_app_test/shared/Doctors.dart';
import 'package:flutter_app_test/shared/Drower.dart';
import 'package:flutter_app_test/shared/icon.dart';
import 'package:flutter_app_test/shared/notLoginDrower.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_app_test/models/Doctors_models.dart';
import 'package:image_picker/image_picker.dart';
import '../AllPrandes.dart';
import '../Cart/CartData.dart';
import '../Cart/CartPage.dart';
import '../insurance/Insurance.dart';
import 'Medication.dart';
import '../Search/FisrtSearch.dart';
import '../TalkToDoctor/requestScreen.dart';
import '../insurance/insuranceNotLogin.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

int current = 0;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isOffers = false;
  bool isInsure = false;
  bool isLogin = isLoggedIn;
  final List<Widget> Loginpages = [
    home(true),
    Offers(),
    InsuranceScreen(false),
  ];
  final List<Widget> notLoginpages = [
    home(false),
    Offers(),
    InsuranceNotLogin(),
  ];
  Timer? timer;
  @override
  void initState() {
    super.initState();
    var rng = new Random();
    timer = Timer.periodic(Duration(minutes: 3), (Timer t) {
      tz.initializeTimeZones();
      if (Cart.length != 0) {
        print('random$rng');
        NotificationService().showNotification(
            1 + rng.nextInt(100),
            "hi ${Usres.name}",
            "${Cart.length}items are still in your cart",
            1);
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        drawer: isLogin
            ? createDrawer(context, Usres.name)
            : createNotLoginDrawer(context),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: current,
          onTap: (index) {
            setState(() {
              current = index;
              switch (index) {
                case 0:
                  isOffers = false;
                  isInsure = false;
                  break;
                case 1:
                  isOffers = true;
                  isInsure = false;
                  break;
                case 2:
                  isOffers = false;
                  isInsure = true;
                  break;
              }
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_offer_rounded,
                size: 30,
              ),
              label: 'Offers',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                MyFlutterApp.umbrella,
                size: 30,
              ),
              label: 'Insurance',
            ),
          ],
        ),
        appBar: !isInsure
            ? PreferredSize(
                preferredSize: Size.fromHeight(125.0),
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
                        centerTitle: isOffers ? true : false,
                        title: !isOffers
                            ? Container(
                                width: 120,
                                height: 30,
                                child: Image.asset('assets/images/logo.png'),
                              )
                            : Text(
                                'Offers',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 27,
                                ),
                              ),
                        actions: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CartPage()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.shopping_cart_rounded,
                                          color: HexColor('#22C4EC'),
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CartPage()));
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    (Cart.length != 0)
                                        ? Expanded(
                                            child: Text(
                                              '${Cart.length}',
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 16,
                                              ),
                                            ),
                                          )
                                        : SizedBox(),
                                  ],
                                ),
                                width: (Cart.length != 0) ? 60 : 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white,
                          ),
                          child: TextField(
                            showCursor: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: isOffers
                                  ? 'Search in Offers'
                                  : 'What Are You Looking for?',
                              hintStyle: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 15,
                              ),
                              prefixIcon: Icon(
                                Icons.search_rounded,
                                color: Colors.grey[400],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Search()));
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : null,
        body: isLogin ? Loginpages[current] : notLoginpages[current],
      ),
    );
  }
}

class home extends StatefulWidget {
  bool? isLogin;
  home(bool isLoginb) {
    this.isLogin = isLoginb;
  }

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  bool isData = true;
  void initState() {
    super.initState();
    getbrandDataFB();
    getCategoryDataFB();
  }

  File? camImage;
  Future pickImage(ImageSource source) async {
    try {
      final camImage = await ImagePicker().pickImage(source: source);
      if (camImage == null) return;

      final ImageTemp = File(camImage.path);
      setState(() {
        this.camImage = ImageTemp;
      });
    } on PlatformException catch (e) {
      print('Failed To Pick An Image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        initialData: [
          getCategoryDataFB(),
          getbrandDataFB(),
        ],
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          }
          return ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: [
                        Container(
                          width: double.infinity,
                          child: Image.asset(
                            'assets/images/gift.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.isLogin!
                                    ? 'YOU EARNED EGP30'
                                    : 'SIGN & GET EGP30',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text('Applies on first order only'),
                              SizedBox(
                                height: 3,
                              ),
                              Text(widget.isLogin!
                                  ? 'Min order value EGP 100'
                                  : ''),
                              SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  widget.isLogin!
                                      ? Text(
                                          'Promo Code:',
                                          style: TextStyle(
                                            color: HexColor('#85BAC6'),
                                            fontSize: 18,
                                          ),
                                        )
                                      : Text(
                                          'SIGN UP',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                        ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  widget.isLogin!
                                      ? Text(
                                          'NEW30',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                              color: HexColor('#2092CA')),
                                        )
                                      : Icon(
                                          Icons.chevron_right_outlined,
                                          size: 15,
                                          color: Colors.blue,
                                        )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Order Medications',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Medication()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: new LinearGradient(
                                  stops: [0.07, 0.07],
                                  colors: [Colors.blue.shade900, Colors.white],
                                  end: const Alignment(0.0, 0.6),
                                  begin: const Alignment(0.0, -1),
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 6.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
//                              Icon(Icons.medication,
//                                size: 70,
//                                color: Colors.blue,
//                              ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Image.asset(
                                    'assets/images/findx.png',
                                    height: 45,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Find',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500
//                                    color: HexColor('#545566')
                                        ),
                                  ),
                                  Text(
                                    'Medication',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500
//                                    color: HexColor('#545566')
                                        ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 320.0,
                                      color: Color(0xFF737373),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20.0),
                                            topLeft: Radius.circular(20.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/prescription.jpg',
                                                width: 130.0,
                                                height: 130.0,
                                              ),
                                              SizedBox(
                                                height: 20.0,
                                              ),
                                              Text(
                                                'Do you want to use your insurance to upload a prescription?',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20.0,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                        border: Border.all(
                                                          color: Colors.orange,
                                                        ),
                                                      ),
                                                      child: MaterialButton(
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      InsuranceScreen(
                                                                          true)));
                                                        },
                                                        elevation: 0.0,
                                                        textColor:
                                                            Colors.orange,
                                                        child: Text(
                                                          'YES',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.orange,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                        border: Border.all(
                                                          color: Colors.orange,
                                                        ),
                                                      ),
                                                      child: MaterialButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                          showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Container(
                                                                  color: Color(
                                                                      0xFF737373),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        topRight:
                                                                            Radius.circular(20.0),
                                                                        topLeft:
                                                                            Radius.circular(20.0),
                                                                      ),
                                                                    ),
                                                                    child: Wrap(
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(20.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsets.all(10.0),
                                                                                child: Text(
                                                                                  'Upload Prescription',
                                                                                  style: TextStyle(
                                                                                    color: Colors.grey,
                                                                                    fontSize: 20.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 15.0,
                                                                              ),
                                                                              Container(
                                                                                height: 1.0,
                                                                                color: Colors.black12,
                                                                              ),
                                                                              SizedBox(
                                                                                height: 15.0,
                                                                              ),
                                                                              GestureDetector(
                                                                                onTap: () {
                                                                                  pickImage(ImageSource.camera);
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                                                                height: 15.0,
                                                                              ),
                                                                              Container(
                                                                                height: 1.0,
                                                                                color: Colors.black12,
                                                                              ),
                                                                              SizedBox(
                                                                                height: 15.0,
                                                                              ),
                                                                              GestureDetector(
                                                                                onTap: () {
                                                                                  pickImage(ImageSource.gallery);
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                                                                height: 30.0,
                                                                              ),
                                                                              Row(
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Container(
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
                                                        elevation: 0.0,
                                                        textColor: Colors.white,
                                                        child: Text(
                                                          'NO',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: new LinearGradient(
                                  stops: [0.07, 0.07],
                                  colors: [HexColor('#8C91C1'), Colors.white],
                                  end: const Alignment(0.0, 0.6),
                                  begin: const Alignment(0.0, -1),
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 6.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
//                              Icon(Icons.medication,
//                                size: 70,
//                                color: Colors.blue,
//                              ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Image.asset(
                                    'assets/images/prescription.png',
                                    height: 45,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Upload',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500
//                                    color: HexColor('#545566')
                                        ),
                                  ),
                                  Text(
                                    'Prescription',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500
//                                    color: HexColor('#545566')
                                        ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Shop by Category',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CategoryBul(),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Text(
                          'Add Insurance Card ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900),
                        ),
                        Expanded(
                          child: Container(
                            alignment: AlignmentDirectional.centerEnd,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              InsuranceScreen(true)));
                                },
                                child: Text(
                                  'View All',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 120,
                      child: ListView.separated(
                        itemBuilder: (context, index) => insuranceCard(
                          insurance: insurance[index],
                          index: index,
                        ),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => SizedBox(
                          width: 5,
                        ),
                        itemCount: insurance.length,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    isLoggedIn
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Talk to a Doctor',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: AlignmentDirectional.centerEnd,
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Doctors()));
                                          },
                                          child: Text(
                                            'View All',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 10, end: 10),
                                child: GridView.count(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 12.0,
                                    mainAxisSpacing: 0.0,
                                    children:
                                        List.generate(doctor.length, (index) {
                                      return Center(
                                        child:
                                            doctorCard(doctor: doctor[index]),
                                      );
                                    })),
                              ),
                            ],
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Featured Brands',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900),
                        ),
                        Expanded(
                          child: Container(
                            alignment: AlignmentDirectional.centerEnd,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AllPrands()));
                                },
                                child: Text(
                                  'View All',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BrandsBul(),
                  ],
                ),
              ),
            ],
          );
        });
  }
}

class Insurance {
  const Insurance({this.title, this.path});
  final String? title;
  final String? path;
}

const List<Insurance> insurance = const <Insurance>[
  const Insurance(
      title: 'MetLife',
      path:
          'https://archive.org/download/metlife-new-logo-500/metlife-new-logo-500.jpg'),
  const Insurance(
      title: 'AXA',
      path:
          'https://www.stratumn.com/medias/32024-1600165209-logo-axa.jpg?lossless=true&auto=format&fm=webp,png&w=1460'),
  const Insurance(
      title: 'Nextcare',
      path:
          'https://s3-eu-west-1.amazonaws.com/wuzzuf/files/company_logo/NEXtCARE-Egypt-23989-1625587858.png'),
  const Insurance(
      title: 'MedNet',
      path:
          'https://csscf.b8cdn.com/120x120/images/logo/66/x1491866_logo_1576487345_n.png.pagespeed.ic.lygXrpNvfc.webp'),
  const Insurance(
      title: 'Unicare',
      path:
          'https://unicare-egypt.com/wp/wp-content/uploads/2019/11/Unicare-Blue.png'),
  const Insurance(
      title: 'Roche',
      path:
          'https://logosvector.net/wp-content/uploads/2012/11/roche-logo-vector.png'),
  const Insurance(
      title: 'MediConsult',
      path:
          'https://s3-eu-west-1.amazonaws.com/wuzzuf/files/company_logo/Mediconsult-Egypt-13897.png'),
  const Insurance(
      title: 'AMC',
      path:
          'https://www.hotlinesegypt.com/wp-content/uploads/2019/04/%D8%A7%D9%84%D8%A3%D9%87%D9%84%D9%8A-%D9%84%D9%84%D8%AE%D8%AF%D9%85%D8%A7%D8%AA-%D8%A7%D9%84%D8%B7%D8%A8%D9%8A%D8%A9-19462-372x400.png'),
];

class insuranceCard extends StatelessWidget {
  const insuranceCard({Key? key, this.insurance, required this.index})
      : super(key: key);
  final Insurance? insurance;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 100,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => isLoggedIn
                              ? InsuranceDetails(
                                  card: card[index].cardDetailsModel,
                                )
                              : InsuranceNotLogin()),
                    );
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          '${insurance!.path}',
                          width: 90,
                          height: 20,
                        ),
                      )),
                ),
              ),
              Divider(
//              color: Colors.grey,
                height: 0,
                thickness: 1,
                endIndent: 5,
                indent: 5,
              ),
              Container(
                height: 40,
                padding: EdgeInsetsDirectional.only(top: 10),
                child: Container(
                  child: Text(
                    '${insurance!.title}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}

const List<Doctor> doctor = const <Doctor>[
  const Doctor(
      title: 'COVID-19', path: 'assets/images/covid.png', color: '#06428b'),
  const Doctor(
      title: 'Stomack',
      path: 'assets/images/stomachache.png',
      color: '#43b7ac'),
  const Doctor(
      title: 'Fever', path: 'assets/images/fever.png', color: '#e65b60'),
  const Doctor(
      title: 'Diarrhea', path: 'assets/images/diarrhea.png', color: '#8d93c3'),
  const Doctor(
      title: 'Sinus', path: 'assets/images/sinus.png', color: '#88214c'),
  const Doctor(
      title: 'Migraines', path: 'assets/images/headache.png', color: '#71d1fb'),
];

class doctorCard extends StatelessWidget {
  const doctorCard({Key? key, this.doctor}) : super(key: key);
  final Doctor? doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RequestScreen()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: new LinearGradient(
                    stops: [0.07, 0.07],
                    colors: [HexColor('${doctor!.color}'), Colors.white],
                    end: const Alignment(0.0, 0.6),
                    begin: const Alignment(0.0, -1),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
//                              Icon(Icons.medication,
//                                size: 70,
//                                color: Colors.blue,
//                              ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      '${doctor!.path}',
                      height: 35,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${doctor!.title}',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500
//                                    color: HexColor('#545566')
                          ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
