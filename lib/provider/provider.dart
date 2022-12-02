import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class HomeProvider extends ChangeNotifier {
  double? lon, lat;

  List list = [];

  void getPositon() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lon = position.longitude;
    lat = position.latitude;

    List placemark = await placemarkFromCoordinates(lat!, lon!);
    list = placemark;
    notifyListeners();
  }
}
