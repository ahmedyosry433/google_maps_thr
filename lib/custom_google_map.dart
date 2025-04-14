import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition _initialCameraPosition;
  @override
  void initState() {
    _initialCameraPosition = CameraPosition(
      target: LatLng(30.706368839245755, 31.263023529301837),
      zoom: 14 ,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(initialCameraPosition: _initialCameraPosition);
  }
}
