import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/keys/secret_key.dart';
import 'package:http/http.dart' as http;

class LocationUtil {
  static String generateLocationPreviewImage(
      {required double latitude, required double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=${SecretKey.GOOGLE_API_KEY}';
  }

  static Future<String> getAddressFrom(LatLng position) async {
    final Uri url = Uri.parse(
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=${SecretKey.GOOGLE_API_KEY}");
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
