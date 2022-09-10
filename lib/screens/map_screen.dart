import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var markers = HashSet<Marker>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   centerTitle: true,
      //   title: const Text(
      //     'Google Maps',
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontSize: 24.0,
      //     ),
      //   ),
      // ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(31.041568, 31.384862),
              zoom: 19.0,
            ),
            onMapCreated: (GoogleMapController googleMapController) async {
              setState(() {
                markers.add(
                  const Marker(
                    markerId: MarkerId('1'),
                    position: LatLng(31.041568, 31.384862),
                  ),
                );
              });
            },
            markers: markers,
          ),
          const SafeArea(
            child: Text(
              'Google Maps',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
