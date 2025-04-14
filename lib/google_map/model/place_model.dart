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
