import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:pankaj_fires/controller/saveLocationLogs.dart';

class LocationController extends GetxController {
  late StreamSubscription<LocationData> locationSubscription;
  late GoogleMapController mapscontroller;
  var counter = ''.obs;
  var issettelite = false.obs;
  var isTripStated = false.obs;
  Location location = Location();
  var latlen = <LatLng>[].obs;
  String fileName = "Demo";
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

  startTrip() {
    double? userLatitude = 0.0;
    double? userLongitude = 0.0;
    double totalDistance = 0.0;
    double dataInKm = 0.0;
    locationSubscription =
        location.onLocationChanged.listen((LocationData currentLocation) {
      if (userLatitude != 0.0) {
        totalDistance += calculateDistance(userLatitude, userLongitude,
            currentLocation.latitude, currentLocation.longitude);
        var localList = {
          "Latitude": currentLocation.latitude,
          "Longitude": currentLocation.longitude,
          "CreatedDate": "${DateTime.now()}",
          "TotalDistance": "$totalDistance"
        };
        sendLogs(localList);
        latlen
            .add(LatLng(currentLocation.latitude!, currentLocation.longitude!));
        for (int i = 0; i < latlen.length; i++) {
          poly.add(Polyline(
              polylineId: PolylineId('1'),
              width: 2,
              color: Colors.blue,
              points: latlen));
        }
      }
    });
  }

  Future<List?> sendLogs(var localList) async {
    var readStoredData = [].obs;
    var localList = [].obs;
    try {
      saveLogs().read(fileName).then((value) {
        if (value != null) {
          readStoredData = value;
        }
      });
      Future.delayed(Duration(seconds: 1), () {
        localList.add(localList);
        readStoredData.addAll(localList);
      });
      saveLogs().writeCounter(json.encode(readStoredData), fileName);
    } catch (e) {
      print('errrrrroooooooooor.....${e}');
    }
  }
}
