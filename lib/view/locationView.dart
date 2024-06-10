import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pankaj_fires/controller/locationController.dart';

class LocationPage extends StatelessWidget {
  LocationPage({Key? key}) : super(key: key);
  final LocationController controller = Get.put(LocationController());
  var issettelite = false.obs;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Your location"),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios)),
          actions: [
            IconButton(
                tooltip: 'Settelite Mode',
                onPressed: () {
                  issettelite.value = !issettelite.value;
                },
                icon: Icon(Icons.maps_home_work_outlined))
          ],
        ),
        body: Obx(() {
          if (controller.latlen.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                Flexible(
                  flex: 10,
                  child: GoogleMap(
                    buildingsEnabled: true,
                    initialCameraPosition: controller.currentposs.value,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    markers: Set<Marker>.of(controller.markerss),
                    onMapCreated: controller.mapCreated,
                    compassEnabled: true,
                    fortyFiveDegreeImageryEnabled: true,
                    indoorViewEnabled: true,
                    mapToolbarEnabled: true,
                    rotateGesturesEnabled: true,
                    scrollGesturesEnabled: true,
                    tiltGesturesEnabled: true,
                    trafficEnabled: true,
                    zoomControlsEnabled: true,
                    zoomGesturesEnabled: true,
                    mapType: issettelite == true
                        ? MapType.satellite
                        : MapType.normal,
                  ),
                ),
                Flexible(child: Center(child: Text('Total Distance: ${20} Km')))
              ],
            );
          }
        }),
      ),
    );
  }
}
