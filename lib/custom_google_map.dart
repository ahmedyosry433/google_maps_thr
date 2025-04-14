import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition _initialCameraPosition;
  late CameraTargetBounds _cameraTargetBounds;
  @override
  void initState() {
    //init camera
    _initialCameraPosition = CameraPosition(
      target: LatLng(30.039568863136346, 31.224324129782307),
      zoom: 12,
    );

    // تحديد التحرك بالكاميرا

    _cameraTargetBounds = CameraTargetBounds(
      LatLngBounds(
        southwest: LatLng(30.030821915403028, 31.217313405996926),
        northeast: LatLng(30.04757878332655, 31.23375767722881),
      ),
    );
    initMarkers();
    super.initState();
  }

  void initMarkers() {
    var myMarker = const Marker(
      markerId: MarkerId('1'),
      position: LatLng(30.039568863136346, 31.224324129782307),
    );
    markers.add(myMarker);
  }

  void initStyle() async {
    String mapStyle = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    _googleMapController.setMapStyle(mapStyle);
  }

  late GoogleMapController _googleMapController;

  Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
            markers: markers,

            // map type when using style makesure hash map type
            // mapType: MapType.normal,
            //on change on map
            onMapCreated: (cotroller) {
              _googleMapController = cotroller;
              initStyle();
            },
            // تحديد التحرك بالكاميرا
            // cameraTargetBounds: _cameraTargetBounds,

            //init camera
            initialCameraPosition: _initialCameraPosition),
        Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: ElevatedButton(
                onPressed: () {
                  CameraPosition _newCameraPosition = CameraPosition(
                      target: LatLng(31.2119788242409, 29.929802146194174),
                      zoom: 12);

                  _googleMapController.animateCamera(
                    // CameraUpdate.newCameraPosition(_newCameraPosition),
                    //? best way to update latlng
                    CameraUpdate.newLatLng(
                      LatLng(31.2119788242409, 29.929802146194174),
                    ),
                  );
                },
                child: Text('change location')))
      ],
    );
  }
}
