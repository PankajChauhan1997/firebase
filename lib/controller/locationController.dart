import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationController extends GetxController {
  late GoogleMapController mapscontroller;
  Location location = Location();
  var latlen = <LatLng>[].obs;
  var currentposs = CameraPosition(
          target: LatLng(
            0.0,
            0.0,
          ),
          zoom: 18)
      .obs;
  final markerss = <Marker>{}.obs;
  final poly = <Polyline>{}.obs;

  @override
  void onInit() {
    super.onInit();
    location.getLocation().then((value) {
      latlen.add(LatLng(value.latitude!, value.longitude!));
      print("inside valuee11111111111 ${latlen}");
      currentposs.value =
          CameraPosition(target: LatLng(value.latitude!, value.longitude!));
      print("inside valuee22222222222 ${latlen}");

      markerss.add(Marker(
        position: latlen[0],
        markerId: MarkerId('0'),
        infoWindow: InfoWindow(title: 'You'),
      ));
    });
    for (int i = 0; i < latlen.length; i++) {
      poly.add(
        Polyline(
            polylineId: PolylineId('1'), points: latlen, color: Colors.blue),
      );
    }
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  void mapCreated(GoogleMapController mapcontroller) {
    mapscontroller = mapcontroller;
  }
}
