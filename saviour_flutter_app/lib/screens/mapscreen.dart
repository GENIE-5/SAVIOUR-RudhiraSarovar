import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({ Key? key }) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {

late GoogleMapController mapController;
void onMapCreated(GoogleMapController controller){

  mapController=controller;

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:Text("Maps") ,
        backgroundColor: Colors.redAccent[200],
      ),

      body: GoogleMap(
        onMapCreated: onMapCreated,
        initialCameraPosition:CameraPosition(
          target: LatLng(
          18.260236,78.8828383
        ),
        zoom: 15,
      ) ),
      
    );
  }
}