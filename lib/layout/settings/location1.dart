import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:map_launcher/map_launcher.dart';


class Location1 extends StatefulWidget {
  const Location1({Key? key}) : super(key: key);

  @override
  _Location1State createState() => _Location1State();
}

class _Location1State extends State<Location1> {
  late LocationData myLocation;
  var location =new Location();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Your Addresses'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child:Container(
                child:Image.asset('assets/images/loc.PNG')
              )
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.deepOrange,
            ),
            child: TextButton(
              child: Text('ADD ADDRESS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),),
              onPressed: () async {
                var serviceEnable =await location.serviceEnabled();
                if(! serviceEnable) {
                  serviceEnable = await location.requestService();
                  if (!serviceEnable) {
                    return;
                  }
                }

                var permission =await location.hasPermission();
                if( permission== PermissionStatus.denied) {
                  permission = await location.requestPermission();
                  if (permission != PermissionStatus.granted) {
                    return;
                  }
                }

                myLocation = await location.getLocation();
                print(myLocation);
                //get lat,long


                final availableMaps = await MapLauncher.installedMaps;
                print(availableMaps); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

                await availableMaps.first.showMarker(
                  coords: Coords(myLocation.longitude!.toDouble(),myLocation.latitude!.toDouble() ),
                  title: "location",
                );


              },
            ),
          )

        ],
      ),
    );
  }

}
