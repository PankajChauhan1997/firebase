import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  final LatLng currentpos = LatLng(19.221512, 73.164459);
  late GoogleMapController mapscontroller;

  void mapCreated(GoogleMapController mapcontroller) {
    mapscontroller = mapcontroller;
  }
}
