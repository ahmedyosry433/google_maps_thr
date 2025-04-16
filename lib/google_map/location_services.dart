import 'dart:developer';

import 'package:location/location.dart';

class LocationService {
  Location location = Location();
  Future<bool> checkAndRequestLocationService() async {
    var isServiceEnabled = await location.serviceEnabled();

    if (!isServiceEnabled) {
      log('========= is Service Enabled =====$isServiceEnabled');

      isServiceEnabled = await location.requestService();

      log('========= is Service Request =====$isServiceEnabled');
      if (!isServiceEnabled) {
        log('========= is Service Request =====$isServiceEnabled');
        return false;
      }
    }
    checkAndRequestLocationPermission();
    return true;
  }

  Future<bool> checkAndRequestLocationPermission() async {
    var permissionStatus = await location.hasPermission();

    if (permissionStatus == PermissionStatus.deniedForever) {
      return false;
    }

    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();

      return permissionStatus == PermissionStatus.granted;
    }

    return true;
  }

  void getRealTimeLocationData(void Function(LocationData)? onData) {
    // stream is send data after 3 meters
    location.changeSettings(
      distanceFilter: 3,
    );

    // listen on location changed
    location.onLocationChanged.listen(onData);
  }
}
