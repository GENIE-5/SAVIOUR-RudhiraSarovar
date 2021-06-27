// import 'package:http/http.dart' as http;
// import 'package:places_autocomplete/src/models/place.dart';
// import 'dart:convert' as convert;

// import 'package:places_autocomplete/src/models/place_search.dart';

// class PlacesService {
//   final key = 'YOUR_KEY';

//   Future<List<PlaceSearch>> getAutocomplete(String search) async {
//     var url =
//         'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(cities)&key=$key';
//     var response = await http.get(url);
//     var json = convert.jsonDecode(response.body);
//     var jsonResults = json['predictions'] as List;
//     return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
//   }
// }
