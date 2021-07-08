import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

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
void initState(){

  super.initState();

  allMarkers.add(
    Marker(
      markerId:MarkerId(
      "korutla"
    ),
    position: LatLng( 18.8208099,78.7134866 ),

    )
  );

}

getLocationFromName() async {
 var query="Gandhi Hospital,Secunderab,Hyderabad";

dynamic loc= await locationFromAddress(query);
// //var first= loc.first;
 print(loc);

 dynamic placemark = placemarkFromCoordinates( 17.4236318,78.503858);

print("placemark ");
print(placemark);

}

List<Marker> allMarkers =[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:Text("Maps") ,
        backgroundColor: Colors.redAccent[200],
        actions: [
          IconButton(onPressed: () async{
            await getLocationFromName();
          }, icon: Icon(Icons.map),
          )
        ],
      ),

      body: GoogleMap(
        onMapCreated: onMapCreated,
        initialCameraPosition:CameraPosition(
          target: LatLng(
           18.8208099,78.7134866 
        ),
        zoom: 15,
        
      ),
      markers: Set.from(allMarkers),
      
       ),
      
    );
  }
}