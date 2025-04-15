import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  final String id;
  final String name;
  final LatLng latLng;

  PlaceModel({
    required this.id,
    required this.name,
    required this.latLng,
  });
}

List<PlaceModel> places = [
  PlaceModel(
    id: '1',
    name: 'pri_club',
    latLng: LatLng(31.192071420462067, 29.932813693533546),
  ),
  PlaceModel(
    id: '2',
    name: 'asmak_lol',
    latLng: LatLng(
      31.155339682806684,
      29.848346936482027,
    ),
  ),
  PlaceModel(
    id: '3',
    name: 'sphinx_airport',
    latLng: LatLng(30.105787649748283, 30.882826365032162),
  ),
];

List<Polyline> polyline = [
  Polyline(
      width: 4,
      color: Colors.brown,
      startCap: Cap.roundCap,
      polylineId: PolylineId('5'),

      //? shap of line
      // patterns: [
      //   PatternItem.dot
      // ],
      points: [
        LatLng(30.105787649748283, 30.882826365032162),
        LatLng(31.192071420462067, 29.932813693533546),
        LatLng(
          31.155339682806684,
          29.848346936482027,
        ),
      ]),
];
List<Polygon> polygonList = [
  Polygon(

      // to make holes in polygen
      holes: [
        // [
        //   LatLng(31.246394887348455, 29.97239182523352),
        //   // LatLng(31.192071420462067, 29.932813693533546),
        //   LatLng(31.121565748055243, 29.829226246005234),
        //   LatLng(31.16094140640586, 29.973765116161367),
        // ]
      ],
      strokeColor: Colors.transparent,
      strokeWidth: 2,
      fillColor: Colors.black.withOpacity(0.2),
      polygonId: PolygonId('5'),

      //? shap of line
      // patterns: [
      //   PatternItem.dot
      // ],
      points: [
        LatLng(31.246394887348455, 29.97239182523352),
        // LatLng(31.192071420462067, 29.932813693533546),
        LatLng(31.121565748055243, 29.829226246005234),
        LatLng(31.16094140640586, 29.973765116161367),
        LatLng(31.20176902241748, 30.056849217296246),
      ]),
  Polygon(
      strokeColor: Colors.transparent,
      strokeWidth: 2,
      fillColor: Colors.black.withOpacity(0.2),
      polygonId: PolygonId('5'),

      //? shap of line
      // patterns: [
      //   PatternItem.dot
      // ],
      points: [
        LatLng(31.08599607159354, 29.894114241687788),
        LatLng(31.028056623733594, 29.76399492627407),
        LatLng(31.070411771042913, 29.928103192152058),
      ]),
];
