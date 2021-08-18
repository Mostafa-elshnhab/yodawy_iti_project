import 'package:flutter_app_test/models/insurance_card_details.dart';

class InsuranceCard {
  String? imgPath;
  InsuranceCardDetails? cardDetailsModel;
  InsuranceCard({this.imgPath , this.cardDetailsModel});
}

List<InsuranceCard> card = [
  InsuranceCard(
      imgPath: 'https://archive.org/download/metlife-new-logo-500/metlife-new-logo-500.jpg' ,
     cardDetailsModel: InsuranceCardDetails(
       insuranceImg: 'https://archive.org/download/metlife-new-logo-500/metlife-new-logo-500.jpg' ,
       cardNumberImg: 'assets/images/insurance_card.jpg',
     ),
  ),
  InsuranceCard(
      imgPath: 'https://www.stratumn.com/medias/32024-1600165209-logo-axa.jpg?lossless=true&auto=format&fm=webp,png&w=1460',
    cardDetailsModel: InsuranceCardDetails(
      insuranceImg: 'https://www.stratumn.com/medias/32024-1600165209-logo-axa.jpg?lossless=true&auto=format&fm=webp,png&w=1460' ,
      cardNumberImg: 'assets/images/insurance_card.jpg',
    ),
  ),
  InsuranceCard(imgPath: 'https://s3-eu-west-1.amazonaws.com/wuzzuf/files/company_logo/NEXtCARE-Egypt-23989-1625587858.png',
    cardDetailsModel: InsuranceCardDetails(
      insuranceImg: 'https://s3-eu-west-1.amazonaws.com/wuzzuf/files/company_logo/NEXtCARE-Egypt-23989-1625587858.png' ,
      cardNumberImg: 'assets/images/insurance_card.jpg',
    ),),
  InsuranceCard(imgPath: 'https://csscf.b8cdn.com/120x120/images/logo/66/x1491866_logo_1576487345_n.png.pagespeed.ic.lygXrpNvfc.webp',
    cardDetailsModel: InsuranceCardDetails(
      insuranceImg: 'https://csscf.b8cdn.com/120x120/images/logo/66/x1491866_logo_1576487345_n.png.pagespeed.ic.lygXrpNvfc.webp' ,
      cardNumberImg: 'assets/images/insurance_card.jpg',
    ),),
  InsuranceCard(imgPath: 'https://scontent-hbe1-1.xx.fbcdn.net/v/t1.6435-9/204018665_326063172428226_9185403464257846728_n.jpg?_nc_cat=109&ccb=1-4&_nc_sid=973b4a&_nc_ohc=qljqKlAoTEYAX-e6R8w&_nc_ht=scontent-hbe1-1.xx&oh=9153621d19e058c1870be84788d1d18b&oe=6137DB28',
    cardDetailsModel: InsuranceCardDetails(
      insuranceImg: 'https://scontent-hbe1-1.xx.fbcdn.net/v/t1.6435-9/204018665_326063172428226_9185403464257846728_n.jpg?_nc_cat=109&ccb=1-4&_nc_sid=973b4a&_nc_ohc=qljqKlAoTEYAX-e6R8w&_nc_ht=scontent-hbe1-1.xx&oh=9153621d19e058c1870be84788d1d18b&oe=6137DB28' ,
      cardNumberImg: 'assets/images/insurance_card.jpg',
    ),),
  InsuranceCard(imgPath: 'https://scontent-hbe1-1.xx.fbcdn.net/v/t1.6435-9/51590767_2370739323154908_6668983354735460352_n.png?_nc_cat=103&ccb=1-4&_nc_sid=973b4a&_nc_ohc=gbP26FsFjT8AX-YBxUW&_nc_ht=scontent-hbe1-1.xx&oh=ed0691781f07ee6705c68299cf292978&oe=6137D81A',
    cardDetailsModel: InsuranceCardDetails(
      insuranceImg: 'https://scontent-hbe1-1.xx.fbcdn.net/v/t1.6435-9/51590767_2370739323154908_6668983354735460352_n.png?_nc_cat=103&ccb=1-4&_nc_sid=973b4a&_nc_ohc=gbP26FsFjT8AX-YBxUW&_nc_ht=scontent-hbe1-1.xx&oh=ed0691781f07ee6705c68299cf292978&oe=6137D81A' ,
      cardNumberImg: 'assets/images/insurance_card.jpg',
    ),),
  InsuranceCard(imgPath: 'https://s3-eu-west-1.amazonaws.com/wuzzuf/files/company_logo/Mediconsult-Egypt-13897.png',
    cardDetailsModel: InsuranceCardDetails(
      insuranceImg: 'https://s3-eu-west-1.amazonaws.com/wuzzuf/files/company_logo/Mediconsult-Egypt-13897.png' ,
      cardNumberImg: 'assets/images/insurance_card.jpg',
    ),),
  InsuranceCard(imgPath: 'https://scontent-hbe1-1.xx.fbcdn.net/v/t1.6435-9/51590767_2370739323154908_6668983354735460352_n.png?_nc_cat=103&ccb=1-4&_nc_sid=973b4a&_nc_ohc=gbP26FsFjT8AX-YBxUW&_nc_ht=scontent-hbe1-1.xx&oh=ed0691781f07ee6705c68299cf292978&oe=6137D81A',
    cardDetailsModel: InsuranceCardDetails(
      insuranceImg: 'https://scontent-hbe1-1.xx.fbcdn.net/v/t1.6435-9/51590767_2370739323154908_6668983354735460352_n.png?_nc_cat=103&ccb=1-4&_nc_sid=973b4a&_nc_ohc=gbP26FsFjT8AX-YBxUW&_nc_ht=scontent-hbe1-1.xx&oh=ed0691781f07ee6705c68299cf292978&oe=6137D81A' ,
      cardNumberImg: 'assets/images/insurance_card.jpg',
    ),),
];