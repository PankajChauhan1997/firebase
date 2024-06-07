import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pankaj_fires/controller/locationController.dart';

class LocationPage extends StatelessWidget {
  LocationController controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
          child: GoogleMap(
            initialCameraPosition:
                CameraPosition(target: controller.currentpos, zoom: 14),
            onMapCreated: controller.mapCreated,
          ),
        )));
  }
}
