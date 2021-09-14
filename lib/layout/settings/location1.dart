import 'package:flutter/material.dart';
import 'package:flutter_app_test/shared/AddressDetails.dart';
import 'package:location/location.dart';
import 'package:map_launcher/map_launcher.dart';

class Location1 extends StatefulWidget {
  const Location1({Key? key}) : super(key: key);

  @override
  _Location1State createState() => _Location1State();
}

class _Location1State extends State<Location1> {
  late LocationData myLocation;
  var location = new Location();
  bool isempty = true;
  @override
  Widget build(BuildContext context) {
    if (AddressData.length != 0) {
      isempty = false;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Your Addresses'),
        centerTitle: true,
      ),
      body: Column(
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
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.orange,
            ),
            child: TextButton(
              child: Text(
                'ADD ADDRESS',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () async {
                var serviceEnable = await location.serviceEnabled();
                if (!serviceEnable) {
                  serviceEnable = await location.requestService();
                  if (!serviceEnable) {
                    return;
                  }
                }

                var permission = await location.hasPermission();
                if (permission == PermissionStatus.denied) {
                  permission = await location.requestPermission();
                  if (permission != PermissionStatus.granted) {
                    return;
                  }
                }

                myLocation = await location.getLocation();
                print(myLocation);
                //get lat,long

                final availableMaps = await MapLauncher.installedMaps;
                print(
                    availableMaps); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

                await availableMaps.first
                    .showMarker(
                      coords: Coords(myLocation.longitude!.toDouble(),
                          myLocation.latitude!.toDouble()),
                      title: "location",
                      zoom: 19,
                    )
                    .then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdressDetails(0))));
              },
            ),
          )
        ],
      ),
    );
  }
}
