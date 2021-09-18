import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';

class ZoomapFB extends StatefulWidget {
  const ZoomapFB({Key? key}) : super(key: key);

  @override
  _ZoomapFBState createState() => _ZoomapFBState();
}

class _ZoomapFBState extends State<ZoomapFB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FireMap(),
    );
  }
}

class FireMap extends StatefulWidget {
  State createState() => FireMapState();
}

class FireMapState extends State<FireMap> {
  late GoogleMapController _mapController;
  Set<Marker> _markers = Set<Marker>();

  late LatLng geoposition;

  Geolocator geolocator = new Geolocator();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  GeoFlutterFire geo = GeoFlutterFire();

  // Stateful Data
  BehaviorSubject<double> radius = BehaviorSubject.seeded(1);
  late Stream<dynamic> query;

  // Subscription
  late StreamSubscription subscription;

  build(context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(19.029884905822705, 99.92883907839156),
            zoom: 18.5,
          ),
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          mapType: MapType.hybrid,
          markers: _markers,
          compassEnabled: true,
        ),
        Positioned(
          bottom: 50,
          left: 10,
          // ignore: deprecated_member_use
          child: FlatButton(
            child: Icon(
              Icons.pin_drop,
              color: Colors.white,
            ),
            color: Colors.green,
            onPressed: () => _addGeoPoint(),
          ),
        ),
        Positioned(
            bottom: 90,
            left: 0,
            child: Slider(
              min: 1.0,
              max: 3.0,
              divisions: 2,
              value: radius.value,
              //label: 'Radius ${radius.value}km',
              activeColor: Colors.green,
              inactiveColor: Colors.green.withOpacity(0.2),
              onChanged: _updateQuery,
            ))
      ],
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _startQuery();
    setState(() {
      _mapController = controller;
    });
  }

  void _addMarker() {
    setState(
      () {
        _markers.add(
          Marker(
            markerId: MarkerId('test1'),
            position: LatLng(19.03018252622293, 99.92863880674598),
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(title: 'Km1'),
          ),
        );

        _markers.add(
          Marker(
            markerId: MarkerId('test2'),
            position: LatLng(19.030242832078464, 99.92896415836287),
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(title: 'Km3'),
          ),
        );
      },
    );
  }

  // void _animateToUser() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);

  //   geoposition = LatLng(position.latitude, position.longitude);
  // }

  // Set GeoLocation Data
  Future<DocumentReference> _addGeoPoint() async {
    var pos = await Geolocator.getCurrentPosition();
    GeoFirePoint point =
        geo.point(latitude: pos.latitude, longitude: pos.longitude);
    print('hello');
    return firestore.collection('pin_location').add(
      {'position': point.data, 'name': 'User'},
    );
  }

  //Update Markers with Firestore Data
  void _updateMarkers(List<DocumentSnapshot> documentList) {
    _markers.clear();
    print(documentList);
    documentList.forEach(
      (DocumentSnapshot document) {
        GeoPoint pos = document['position']['geopoint'];
        String name = document['name'];
        _markers.add(
          Marker(
            markerId: MarkerId(document.id),
            position: LatLng(pos.latitude, pos.longitude),
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(title: name),
          ),
        );
      },
    );
  }

  void _startQuery() async {
    // Get users location
    var pos = await Geolocator.getCurrentPosition();
    double lat = pos.latitude;
    double lng = pos.longitude;

    // Make a referece to firestore
    var ref = firestore.collection('pin_location');
    GeoFirePoint center = geo.point(latitude: lat, longitude: lng);

    // subscribe to query
    subscription = radius.switchMap((rad) {
      return geo.collection(collectionRef: ref).within(
          center: center, radius: rad, field: 'position', strictMode: true);
    }).listen(_updateMarkers);
  }

  void _updateQuery(value) {
    final zoomMap = {
      1.0: 18.0,
      2.0: 17.5,
      3.0: 16.5,
    };
    final zoom = zoomMap[value];
    _mapController.moveCamera(CameraUpdate.zoomTo(zoom!));

    setState(() {
      radius.add(value);
    });
  }

  @override
  dispose() {
    subscription.cancel();
    super.dispose();
  }
}
