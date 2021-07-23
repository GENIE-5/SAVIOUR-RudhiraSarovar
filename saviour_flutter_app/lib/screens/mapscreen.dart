import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:saviour_flutter_app/blocs/application_bloc.dart';
import 'package:saviour_flutter_app/screens/navigationScreen.dart';
import 'package:saviour_flutter_app/screens/requestScreen.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController mapController;

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();

    allMarkers.add(Marker(
      markerId: MarkerId("korutla"),
      position: LatLng(18.8208099, 78.7134866),
    ));
  }

  getLocationFromName() async {
    var query = "Gandhi Hospital,Secunderab,Hyderabad";

    dynamic loc = await locationFromAddress(query);
// //var first= loc.first;
    print(loc);

    dynamic placemark = placemarkFromCoordinates(17.4236318, 78.503858);

    print("placemark ");
    print(placemark);
  }

  List<Marker> allMarkers = [];

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    allMarkers.add(Marker(
      markerId: MarkerId("korutla"),
      position: LatLng(applicationBloc.currentLocation!.latitude,
          applicationBloc.currentLocation!.longitude),
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text("Maps"),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            onPressed: () async {
              await getLocationFromName();
            },
            icon: Icon(Icons.map),
          )
        ],
      ),
      drawer: Drawer(child: NavigationPage()),
      body: (applicationBloc.currentLocation == null)
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              onMapCreated: onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(applicationBloc.currentLocation!.latitude,
                    applicationBloc.currentLocation!.longitude),
                zoom: 30,
              ),

              //markers: Set<Marker>.of(applicationBloc.markers),
              markers: Set.from(allMarkers),
            ),
      floatingActionButton: getFooter(),
    );
  }

  Widget getFooter() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(height: 5),
        Container(
          height: 100,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.20),
              spreadRadius: 20,
              blurRadius: 40,
              // changes position of shadow
            ),
          ], shape: BoxShape.circle, color: Colors.red),
          child: Center(
              child: TextButton(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text('Request',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
              Text('Blood',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
            ]),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return RequestScreen();
              }));
            },
          )),
        ),
      ]),
    );
  }
}
