
import 'package:flutter/material.dart';
import 'package:google_maps/custom_google_map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MapSample(),
    );
  }
}

class MapSample extends StatelessWidget {
  const MapSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MaterialApp(
      home: CustomGoogleMap(),
    ));
  }
}
