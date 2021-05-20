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
    target: LatLng(18.80955145449767, 98.9476815333245),
    zoom: 15.0,
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
        mapType: MapType.hybrid,
        initialCameraPosition: _zoomaps,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
