import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:saviour_flutter_app/blocs/application_bloc.dart';

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
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps"),
        backgroundColor: Colors.redAccent[200],
      ),
      body:(applicationBloc.currentLocation ==null)?
           Center(child:CircularProgressIndicator())
          : GoogleMap(
          onMapCreated: onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(applicationBloc.currentLocation.latitude, applicationBloc.currentLocation.longitude),
            zoom: 40,
          ),
            // markers: Set<Marker>.of(applicationBloc.markers),
          ),
    );
  }
}
