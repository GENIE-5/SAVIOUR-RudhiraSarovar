import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:saviour_flutter_app/services/geolocator_service.dart';

class ApplicationBloc with ChangeNotifier {
  final geolocatorService = GeolocatorService();

  //variable
 
  Position? currentLocation;
  // List<PlaceSearch> searchResults;
 

  ApplicationBloc() {
    setCurrentLocation();
  }
  setCurrentLocation() async {
    currentLocation = await geolocatorService.getCurrentLocation();
    notifyListeners();
  }

  // searchPlaces(String searchTerm) async {
  //   searchResults = await placesService.getAutocomplete(searchTerm);
  //   notifyListeners();
  // }

}
