import 'package:flutter/material.dart';
import 'package:flutter_app_test/shared/AddressDetails.dart';
import 'package:location/location.dart';
import 'package:map_launcher/map_launcher.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  _Address createState() => _Address();
}

class _Address extends State<Address> {
  bool isempty = true;
  @override
  Widget build(BuildContext context) {
    if (AddressData.length != 0) {
      isempty = false;
    }
    return Column(
      children: [
        Expanded(
            child: isempty
                ? Container(child: Image.asset('assets/images/loc.PNG'))
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.location_on_outlined,
                        size: 18,
                        color: Colors.orange,
                      ),
                      title: Text(
                        '${AddressData[0]}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      subtitle: Text(
                        '${AddressData[1]},${AddressData[2]},${AddressData[3]},${AddressData[4]}${AddressData[5]},',
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              AddressData.clear();
                              isempty = true;
                            });
                          },
                          icon: Icon(
                            Icons.delete_outline,
                            color: Colors.orange,
                            size: 18,
                          )),
                    ),
                  )),
      ],
    );
  }
}
