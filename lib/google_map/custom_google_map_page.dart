import 'package:flutter/material.dart';
import 'package:google_maps/google_map/model/place_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMapPage extends StatefulWidget {
  const CustomGoogleMapPage({super.key});

  @override
  State<CustomGoogleMapPage> createState() => _CustomGoogleMapPageState();
}

class _CustomGoogleMapPageState extends State<CustomGoogleMapPage> {
  late CameraPosition _initialCameraPosition;
  late CameraTargetBounds _cameraTargetBounds;
  @override
  void initState() {
    //init camera
    _initialCameraPosition = CameraPosition(
      target: places[1].latLng,
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

//! init Markers
  void initMarkers() async {
    //? add coustom marker icon
    var customMarkerIcon = await BitmapDescriptor.asset(
        ImageConfiguration(size: Size(45, 45)), 'assets/location.png');
    for (PlaceModel place in places) {
      markers.add(Marker(
        icon: customMarkerIcon,
        infoWindow: InfoWindow(
          title: place.name,
          snippet: 'TEST',
        ),
        markerId: MarkerId(place.id),
        position: place.latLng,
      ));
    }

    setState(() {});
  }

  late GoogleMapController _googleMapController;

  Set<Marker> markers = {};
  Set<Polyline> polylineInHome = {};
  Set<Polygon> polygonInHome = {};
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
            // circles: {
            //   Circle(
            //     circleId: CircleId('1'),
            //     fillColor: Colors.red.withOpacity(0.3),
            //     radius: 2 * 1000,
            //     strokeWidth: 2,
            //     strokeColor: Colors.white,
            //     center: places[1].latLng,
            //   ),
            // },
            //? polygon
            // polygons: polygonInHome,
            //? polyline
            // polylines: polylineInHome,
            // zoomControlsEnabled: false,
            //? map type when using style makesure hash map type
            // mapType: MapType.normal,

            //? تحديد التحرك بالكاميرا
            // cameraTargetBounds: _cameraTargetBounds,
            //? to remove curent location from ios
            myLocationButtonEnabled: false,

            //?on change on map
            onMapCreated: (cotroller) {
              _googleMapController = cotroller;
              initStyle();
              // initPolyline();
              // initPolygon();
            },
            markers: markers,

            //?init camera
            initialCameraPosition: _initialCameraPosition),

        //*====================== BTN ==========================
        Positioned(
            bottom: 16,
            left: 90,
            right: 90,
            child: ElevatedButton(
                onPressed: () {
                  CameraPosition _newCameraPosition =
                      CameraPosition(target: places[2].latLng, zoom: 12);

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

  //! init Polyline
  void initPolyline() async {
    Set<Polyline> polylineFromMap =
        polyline.map((polyline) => polyline).toSet();

    polylineInHome.addAll(polylineFromMap);
  }

//! init Polygon
  void initPolygon() async {
    Set<Polygon> polygonFromMap =
        polygonList.map((polyline) => polyline).toSet();

    polygonInHome.addAll(polygonFromMap);
  }

//! init Style Func
  void initStyle() async {
    String mapStyle = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    _googleMapController.setMapStyle(mapStyle);
  }
}
