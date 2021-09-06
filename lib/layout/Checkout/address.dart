import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:map_launcher/map_launcher.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  _Address createState() => _Address();
}

class _Address extends State<Address> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container(child: Image.asset('assets/images/loc.PNG'))),
      ],
    );
  }
}
