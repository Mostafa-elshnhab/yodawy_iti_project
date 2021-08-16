import 'package:flutter/material.dart';
import 'package:flutter_app_test/layout/Product/Products.dart';
import 'package:flutter_app_test/models/HomePrandsModel.dart';
import 'package:flutter_app_test/shared/components.dart';

class AllPrands extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarBuilder('Prands', context),
        body: SingleChildScrollView(
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
                    children: List.generate(prands.length, (index) {
                      return Center(
                        child: prandsCard(prands: prands[index]),
                      );
                    })),
              ],
            ),
          ),
        ));
  }
}

const List<Prands> prands = const <Prands>[
  const Prands(
      path:
          'https://skin.shop/wp-content/uploads/2020/02/La-Roche-Posay-Logo.png',
      titel: 'La Roche Posay'),
  const Prands(
      path:
          'https://cdn.freelogovectors.net/wp-content/uploads/2019/09/Vichy-logo.png',
      titel: 'Vichy'),
  const Prands(
      path:
          'https://logos-world.net/wp-content/uploads/2020/04/LOreal-Emblem.png',
      titel: 'L\'Oreal Parise'),
  const Prands(
      path:
          'https://1000logos.net/wp-content/uploads/2020/04/AXE-Logo-2007.jpg',
      titel: 'Axe'),
  const Prands(
      path:
          'https://logos-world.net/wp-content/uploads/2020/12/Garnier-Logo.png',
      titel: 'Garnier'),
  const Prands(
      path:
          'https://logos-world.net/wp-content/uploads/2020/09/Always-Logo.png',
      titel: 'Always'),
  const Prands(
      path:
          'https://logos-world.net/wp-content/uploads/2020/11/Bioderma-Emblem.png',
      titel: 'Bioderma'),
  const Prands(
      path:
          'https://logos-world.net/wp-content/uploads/2020/11/Johnsons-Baby-Symbol.png',
      titel: 'The New Johnson\'s'),
  const Prands(
      path: 'https://1000logos.net/wp-content/uploads/2021/06/Lux-Logo.png',
      titel: 'Lux'),
  const Prands(
      path:
          'https://s3-eu-west-1.amazonaws.com/wuzzuf/files/company_logo/BioPharmaEgypt--S-A-E--Egypt-18567-1527277426-og.png',
      titel: 'Biophe'),
  const Prands(
      path:
          'https://e7.pngegg.com/pngimages/30/899/png-clipart-electric-toothbrush-oral-b-dental-floss-oral-health-blue-text.png',
      titel: 'Oral-B'),
  const Prands(
      path: 'https://mark.trademarkia.com/services/logo.ashx?sid=86401803',
      titel: 'Hero Baby'),
  const Prands(
      path: 'https://pepperyspot.com/wp-content/uploads/2020/09/gliss-logo.png',
      titel: 'Gliss'),
  const Prands(
      path:
          'https://seeklogo.com/images/E/eva-cosmrtics-logo-2D700CCB77-seeklogo.com.png',
      titel: 'Eva'),
  const Prands(
      path: 'https://1000logos.net/wp-content/uploads/2019/11/Durex-Logo.png',
      titel: 'Durex'),
  const Prands(
      path:
          'https://logos-world.net/wp-content/uploads/2020/11/Nivea-Logo-2004-2011.png',
      titel: 'Nivea'),
  const Prands(
      path:
          'https://logos-world.net/wp-content/uploads/2020/11/Pantene-Logo-2010-2012.png',
      titel: 'Pantene'),
  const Prands(
      path:
          'https://logos-download.com/wp-content/uploads/2016/05/Dettol_logo_logotype.jpg',
      titel: 'Dettol'),
  const Prands(
      path:
          'https://vegconom.de/vegconomistcom/wp-content/uploads/sites/3/nestle.png',
      titel: 'Nestle'),
  const Prands(
      path:
          'https://logos-world.net/wp-content/uploads/2020/11/Palette-Logo.png',
      titel: 'Palette'),
  const Prands(
      path:
          'https://logos-world.net/wp-content/uploads/2020/11/Rexona-Logo-2015-present.jpg',
      titel: 'Rexona'),
  const Prands(
      path:
          'https://cdn.salla.sa/PeBV/iJkTBmoBULbN7wPTMtQBwfqsJ46S6rW3x79CHm3V.jpg',
      titel: 'Sensodyne'),
  const Prands(
      path:
          'https://images.all-free-download.com/images/graphiclarge/johnson_logo_29463.jpg',
      titel: 'Jonson\'s'),
  const Prands(
      path:
          'https://e7.pngegg.com/pngimages/390/684/png-clipart-mustela-hydra-bebe-body-lotion-cream-moisturizer-skin-care-child-blue-cream-thumbnail.png',
      titel: 'Mustela'),
  const Prands(
      path:
          'https://seifstores.net/wp-content/uploads/2020/06/logo_canpol-new-500x500-1.jpg',
      titel: 'Canpol Babies'),
  const Prands(
      path:
          'https://seeklogo.com/images/L/Luna-logo-3EE7DC2A27-seeklogo.com.png',
      titel: 'Luna'),
  const Prands(
      path:
          'https://seeklogo.com/images/M/molfix-logo-D4DCC4F9F2-seeklogo.com.png',
      titel: 'Molfix'),
  const Prands(
      path:
          'https://logodownload.org/wp-content/uploads/2014/04/gillette-logo-1.png',
      titel: 'Gillrtte'),
  const Prands(
      path:
          'https://logos-download.com/wp-content/uploads/2021/01/Sanosan_Logo.png',
      titel: 'Sanosan'),
  const Prands(
      path:
          'https://1000logos.net/wp-content/uploads/2020/04/Carefree-Logo.png',
      titel: 'Carefree'),
  const Prands(
      path: 'https://www.hansapost.ee/globalassets/brandimages/signal.png',
      titel: 'Signal'),
  const Prands(
      path:
          'https://logos-download.com/wp-content/uploads/2019/01/Uriage_Eau_Thermale_Logo.png',
      titel: 'Uriage'),
  const Prands(
      path:
          'https://cdn.salla.sa/ARbO/wZ4nlGbyplpiBXguG9zudUT0BZVffHImn10xbeGd.jpg',
      titel: 'Vatica'),
  const Prands(
      path:
          'https://skin.shop/wp-content/uploads/2020/02/Isis-1-e1618750425446.png',
      titel: 'Isis Pharma'),
  const Prands(
      path:
          'https://www.pngitem.com/pimgs/m/1-15653_listerine-logo-png-transparent-listerine-png-download.png',
      titel: 'Listerine'),
  const Prands(
      path:
          'https://mb.cision.com/Public/7240/9521036/bbaad97caf59e7e7_org.jpg',
      titel: 'Nuxe'),
  const Prands(path: 'https://logodix.com/logo/821865.png', titel: 'TRESemme'),
  const Prands(
      path:
          'https://seeklogo.com/images/A/avene-logo-E2B97CFADE-seeklogo.com.png',
      titel: 'Avene'),
  const Prands(
      path: 'https://logowik.com/content/uploads/images/739_pampers.jpg',
      titel: 'Pampers'),
  const Prands(
      path:
          'https://cdn.freelogovectors.net/wp-content/uploads/2020/03/herbal-essences-logo.png',
      titel: 'Herbal Essences'),
  const Prands(
      path:
          'https://mir-s3-cdn-cf.behance.net/project_modules/disp/a9658e54690933.56094f14066ee.jpg',
      titel: 'Veet'),
  const Prands(
      path: 'https://www.minia.edu.eg/images/fci/fci2018-06-261858094.png',
      titel: 'Acm'),
  const Prands(
      path: 'http://www.ranklogos.com/wp-content/uploads/2014/10/Sunsilk.jpg',
      titel: 'Sunsilk'),
  const Prands(
      path:
          'https://seeklogo.com/images/F/fine-logo-691FB7131B-seeklogo.com.png',
      titel: 'Fine'),
  const Prands(
      path: 'https://behindthechair.com/wp-content/uploads/2017/05/gk-hair.jpg',
      titel: 'Global Keratin'),
  const Prands(
      path:
          'https://www.pngkey.com/png/detail/77-774056_close-up-logo-close-up-logo-png.png',
      titel: 'Close up'),
  const Prands(
      path:
          'https://logos-world.net/wp-content/uploads/2020/09/Head-Shoulders-Logo-1989-1995.png',
      titel: 'Head And Shoulders'),
  const Prands(
      path:
          'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/a917a032773379.56939c900d378.png',
      titel: 'Hair Code'),
  const Prands(
      path: 'https://mpg-eg.com/wp-content/uploads/Glysoid.png',
      titel: 'Glysolid'),
  const Prands(
      path:
          'https://logos-download.com/wp-content/uploads/2016/03/Labello_logo.png',
      titel: 'Labello'),
  const Prands(
      path:
          'https://logos-world.net/wp-content/uploads/2020/09/Dove-Logo-1969-2004.png',
      titel: 'Dove'),
];

class prandsCard extends StatelessWidget {
  const prandsCard({Key? key, this.prands}) : super(key: key);
  final Prands? prands;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Products(Text: prands!.titel)));
      },
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            child: Image.network(
              '${prands!.path}',
              width: 40,
            ),
          ),
        ),
      ),
    );
  }
}
