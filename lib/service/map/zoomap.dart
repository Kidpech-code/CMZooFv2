import 'dart:async';
import 'package:cmzoofv2/service/map/components/map_bottompill.dart';
import 'package:cmzoofv2/service/map/components/map_userbadge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng SOURCE_LOCATION = LatLng(19.030227294266595, 99.89797479347233);
const LatLng DEST_LOCATION = LatLng(19.028861142490218, 99.89576722954645);
const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;
const double PIN_VISIBLE_POSITION = 20;
const double PIN_INVISIBLE_POSITION = -220;

class Zoomap extends StatefulWidget {
  @override
  _ZoomapState createState() => _ZoomapState();
}

class _ZoomapState extends State<Zoomap> {
  Completer<GoogleMapController> _controller = Completer();
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;
  Set<Marker> _markers = Set<Marker>();
  double pinPillPosition = PIN_VISIBLE_POSITION;

  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;

  late LatLng currentLocation;
  late LatLng destinationLocation;

  // static final CameraPosition _zoomaps = CameraPosition(
  //   target: LatLng(19.030195931842357, 99.89762289307824),
  //   zoom: 15.0,
  // );

  @override
  void initState() {
    super.initState();

    polylinePoints = PolylinePoints();

    //set up initial locations
    this.setInitialLocation();
    //set up the marker icons
    this.setSourceAndDestinationMarkerIcons();
  }

  void setSourceAndDestinationMarkerIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0),
        'images/source_pin_android.png');

    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0),
        'images/destination_pin_android.png');
  }

  void setInitialLocation() {
    currentLocation =
        LatLng(SOURCE_LOCATION.latitude, SOURCE_LOCATION.longitude);

    destinationLocation =
        LatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude);
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition _initialCameraPosition = CameraPosition(
      zoom: CAMERA_ZOOM,
      //tilt: CAMERA_TILT,
      bearing: CAMERA_BEARING,
      target: SOURCE_LOCATION,
    );
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              mapType: MapType.normal,
              myLocationEnabled: true,
              compassEnabled: false,
              tiltGesturesEnabled: false,
              polylines: _polylines,
              markers: _markers,
              initialCameraPosition: _initialCameraPosition,
              onTap: (LatLng loc) {
                // tapping on the map will dismiss the bottom pill
                setState(
                  () {
                    this.pinPillPosition = PIN_INVISIBLE_POSITION;
                  },
                );
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);

                showPinsOnMap();
                setPolylines();
              },
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            top: 100,
            left: 0,
            right: 0,
            child: MapUserBadge(),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            left: 0,
            right: 0,
            bottom: this.pinPillPosition,
            child: MapBottomPill(),
          ),
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   right: 0,
          //   bottom: 0,
          //   child: MainAppBar(
          //     showProfilePic: false,
          //   ),
          // ),
        ],
      ),
    );
  }

  void showPinsOnMap() {
    setState(
      () {
        _markers.add(
          Marker(
            markerId: MarkerId('sourcePin'),
            position: currentLocation,
            icon: sourceIcon,
          ),
        );

        _markers.add(
          Marker(
            markerId: MarkerId('destinationPin'),
            position: destinationLocation,
            icon: destinationIcon,
            onTap: () {
              setState(() {
                this.pinPillPosition = PIN_VISIBLE_POSITION;
              });
            },
          ),
        );
      },
    );
  }

  void setPolylines() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyDM6Vv13W73C025lvkKOQByS39nIOdAH4w",
      PointLatLng(
        currentLocation.latitude,
        currentLocation.longitude,
      ),
      PointLatLng(
        destinationLocation.latitude,
        destinationLocation.longitude,
      ),
      travelMode: TravelMode.walking,
    );
    if (result.status == 'OK') {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      setState(() {
        _polylines.add(
          Polyline(
            width: 5,
            polylineId: PolylineId('polyLine'),
            color: Colors.black,
            points: polylineCoordinates,
          ),
        );
      });
    } else {
      print('err_poly ${result.errorMessage}');
    }
  }
}
