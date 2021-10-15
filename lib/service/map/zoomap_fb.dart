import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmzoofv2/service/map/api_key/api_key.dart';
import 'package:cmzoofv2/service/map/components/map_bottompill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const double CAMERA_ZOOM = 16;
const double CAMERA_BEARING = 30;
const LatLng SOURCE_LOCATION = LatLng(18.8107748473475, 98.94787742930968);
const double PIN_VISIBLE_POSITION = 20;
const double PIN_INVISIBLE_POSITION = -220;
late GoogleMapController myController;
late LatLng geoposition;
late PolylinePoints polylinePoints;
List<LatLng> polylineCoordinates = [];
late LatLng firebaseLocation;

class ZooMapFB extends StatefulWidget {
  @override
  _ZooMapFBState createState() => _ZooMapFBState();
}

class _ZooMapFBState extends State<ZooMapFB> {
  bool track_button = true;
  bool poly_button = true;

  StreamSubscription<Position>? positionStream;

  double pinPillPosition = PIN_INVISIBLE_POSITION;

  Set<Polyline> _polylines = Set<Polyline>();

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void _cameratrack() {
    positionStream =
        Geolocator.getPositionStream(desiredAccuracy: LocationAccuracy.best)
            .listen((Position position) {
      myController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 16.0,
          ),
        ),
      );
    });
  }

  void _uncameratrack() {
    positionStream?.cancel();
  }

  Widget trackBotton() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
        right: 20,
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: ClipOval(
          child: Material(
            color: Colors.grey, // button color
            child: InkWell(
              splashColor: Colors.grey[200], // inkwell color
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 25,
                child: track_button
                    ? Icon(
                        Icons.explore,
                        color: Colors.white,
                        size: 25,
                      )
                    : Icon(
                        Icons.my_location,
                        color: Colors.white,
                        size: 25,
                      ),
              ),
              onTap: () {
                setState(() {
                  track_button ? _cameratrack() : _uncameratrack();
                  track_button = !track_button;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  //เพิ่มและสร้าง Marker
  void initMarker(specify, specifyId) async {
    print('ShowMarker');
    var markerIdval = specifyId;
    final MarkerId markerId = MarkerId(markerIdval);
    final Marker marker = Marker(
      markerId: markerId,
      position:
          LatLng(specify['location'].latitude, specify['location'].longitude),
      //position: LatLng(double.parse(specify['lat']) , double.parse(specify['lng'])),
      infoWindow: InfoWindow(title: specify['title'], snippet: specify['name']),
      onTap: () {
        setPolylines(
            specify['location'].latitude, specify['location'].longitude);
        setState(() {
          this.pinPillPosition = PIN_VISIBLE_POSITION;
        });
      },
    );
    setState(() {
      markers[markerId] = marker;
    });
  }

  //ดึงข้อมูล
  getMarkerData() async {
    FirebaseFirestore.instance.collection("loca_animal").get().then(
      (myMockData) {
        //isNotEmpty คือ ค่า ไม่Null
        if (myMockData.docs.isNotEmpty) {
          for (int i = 0; i < myMockData.docs.length; i++) {
            initMarker(myMockData.docs[i].data(), myMockData.docs[i].id);
          }
        }
      },
    );
  }

  //ตำแหน่งผู้ใช้
  void myCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    geoposition = LatLng(position.latitude, position.longitude);
  }

  //สร้างเส้นทาง
  void setPolylines(lat, lng) async {
    print('line555555');
    //final PolylineId polyId = PolylineId(latlngId);
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      apikey,
      PointLatLng(
        geoposition.latitude,
        geoposition.longitude,
      ),
      PointLatLng(
        lat,
        lng,
      ),
      travelMode: TravelMode.driving,
    );
    polylineCoordinates.clear();
    if (result.status == 'OK') {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      setState(() {
        print(polylineCoordinates);
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

  @override
  void initState() {
    this.getMarkerData();
    this.myCurrentLocation();
    polylinePoints = PolylinePoints();
    super.initState();
  }

  Widget cancelButton() {
    return Container(
      // ignore: deprecated_member_use
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: Colors.red[400],
        child: Text(
          'ยกเลิกเส้นทาง',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'mitr',
          ),
        ),
        onPressed: () {
          _polylines.clear();
          setState(() {
            this.pinPillPosition = PIN_INVISIBLE_POSITION;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition _initialCameraPosition = CameraPosition(
      zoom: CAMERA_ZOOM,
      //tilt: CAMERA_TILT,
      bearing: CAMERA_BEARING,
      target: SOURCE_LOCATION,
    );
    return Stack(
      children: [
        Scaffold(
          body: GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            rotateGesturesEnabled: false,
            tiltGesturesEnabled: false,
            mapToolbarEnabled: false,
            polylines: _polylines,
            markers: Set<Marker>.of(markers.values),
            mapType: MapType.normal,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (GoogleMapController controller) {
              myController = controller;
            },
            onTap: (LatLng loc) {
              // tapping on the map will dismiss the bottom pill
              setState(
                () {
                  this.pinPillPosition = PIN_INVISIBLE_POSITION;
                },
              );
            },
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          left: 130,
          right: 130,
          bottom: this.pinPillPosition,
          child: cancelButton(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomBackButtonM(),
            trackBotton(),
          ],
        ),
      ],
    );
  }
}

class CustomBackButtonM extends StatelessWidget {
  const CustomBackButtonM({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 40,
        left: 20,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
