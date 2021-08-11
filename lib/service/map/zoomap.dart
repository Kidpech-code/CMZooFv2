import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Zoomap extends StatefulWidget {
  @override
  _ZoomapState createState() => _ZoomapState();
}

class _ZoomapState extends State<Zoomap> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _zoomaps = CameraPosition(
    target: LatLng(19.030195931842357, 99.89762289307824),
    zoom: 15.0,
  );

  Set<Circle> circles = Set.from(
    [
      Circle(
        circleId: CircleId('1'),
        center: LatLng(19.030195931842357, 99.89762289307824),
        radius: 80,
        strokeWidth: 2,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //automaticallyImplyLeading: false,
        backgroundColor: Colors.lightGreen[900],
        title: Text(
          'แผนที่สวนสัตว์',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: _zoomaps,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        circles: circles,
      ),
    );
  }
}
