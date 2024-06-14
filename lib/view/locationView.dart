import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pankaj_fires/controller/locationController.dart';

import '../controller/bottomNavigationbar.dart';

class LocationPage extends StatelessWidget {
  LocationPage({Key? key}) : super(key: key);
  final LocationController controller = Get.put(LocationController());

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
                  controller.issettelite.value = !controller.issettelite.value;
                },
                icon: Icon(Icons.maps_home_work_outlined))
          ],
        ),
        bottomNavigationBar: BottomNavigationService.buildBottomNavigation(),
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
                    mapType: controller.issettelite.value == true
                        ? MapType.satellite
                        : MapType.normal,
                  ),
                ),
                Flexible(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "  Total KM: ${controller.counter.value}",
                            style: TextStyle(color: Colors.black, fontSize: 13),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          // Text("$speedCalculater"),
                          Visibility(
                            visible: !controller.isTripStated.value,
                            child: ElevatedButton(
                              onPressed: () {
                                // sendPicture();

                                controller.startTrip();
                                controller.counter.value = "0.0";

                                controller.fileName = "${DateTime.now()}";
                                controller.isTripStated.value = true;
                              },
                              child: Text('Trip Start'),
                            ),
                          ),
                          Visibility(
                            visible: controller.isTripStated.value,
                            child: Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    await controller.locationSubscription
                                        .cancel();

                                    controller.isTripStated.value = false;
                                  },
                                  child: Text("Stop service")),
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            );
          }
        }),
      ),
    );
  }
}
