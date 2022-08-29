import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import '../utils/app_color.dart';
import '../utils/mockdata.dart';

import '../components/app_drawer.dart';
import '../providers/screen_controller.dart';
import '../components/header.dart';
import '../components/activity_item.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

double CAMERA_ZOOM = 13;
double CAMERA_TILT = 0;
double CAMERA_BEARING = 30;
LatLng SOURCE_LOCATION = const LatLng(37.7103717, -121.9275583);
LatLng DEST_LOCATION = const LatLng(37.7103717, -121.8375583);

class _ActivityScreenState extends State<ActivityScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // late GoogleMapController mapController;
  final Completer<GoogleMapController> _controller = Completer();
  final CameraPosition _initialLocation = CameraPosition(
    target: LatLng(
      SOURCE_LOCATION.latitude,
      SOURCE_LOCATION.longitude,
    ),
    zoom: 18,
  );
  late geolocator.Position currentPosition;
  String googleAPIKey = "YOU API KEY";

  final Set<Marker> _markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;

  @override
  void initState() {
    super.initState();
    // _getCurrentLocation();
    setSourceAndDestinationIcons();
  }

  void setSourceAndDestinationIcons() async {
    await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), 'assets/pin.png')
        .then((value) => sourceIcon = value);
    await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), 'assets/pin.png')
        .then((value) => destinationIcon = value);
  }

  convertActivities(String type) {
    switch (type) {
      case "Walking":
        return ActivityItem(
          type: exerciseInfo[0].type,
          distance: exerciseInfo[0].distance,
          time: exerciseInfo[0].time,
          icon: const Icon(
            Icons.directions_walk_rounded,
            size: 40,
            color: Colors.white,
          ),
        );
      case "Running":
        return ActivityItem(
          type: exerciseInfo[1].type,
          distance: exerciseInfo[1].distance,
          time: exerciseInfo[1].time,
          icon: const Icon(
            Icons.directions_run_rounded,
            size: 40,
            color: Colors.white,
          ),
        );
      case "Cycling":
        return ActivityItem(
          type: exerciseInfo[2].type,
          distance: exerciseInfo[2].distance,
          time: exerciseInfo[2].time,
          icon: const Icon(
            Icons.directions_bike_rounded,
            size: 40,
            color: Colors.white,
          ),
        );
      case "Tradmill":
        return ActivityItem(
          type: exerciseInfo[3].type,
          distance: exerciseInfo[3].distance,
          time: exerciseInfo[2].time,
          icon: const Icon(
            Icons.moped_rounded,
            size: 40,
            color: Colors.white,
          ),
        );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldKey,
      drawerScrimColor: Colors.transparent,
      drawer: const AppDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              AppColors.bottomBgColor,
              AppColors.topBgColor,
            ],
          ),
        ),
        child: Stack(
          children: [
            SizedBox(
              width: width,
              height: height,
              child: GoogleMap(
                compassEnabled: false,
                initialCameraPosition: _initialLocation,
                markers: _markers,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                mapType: MapType.normal,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                polylines: Set<Polyline>.of(polylines.values),
                onMapCreated: onMapCreated,
              ),
            ),
            Header(
              isActivity: true,
              onPressed: () {
                if (scaffoldKey.currentState!.isDrawerOpen) {
                  scaffoldKey.currentState!.closeDrawer();
                } else {
                  scaffoldKey.currentState!.openDrawer();
                }
              },
              child: Consumer<ScreenController>(
                builder: (ctx, controller, ch) =>
                    convertActivities(controller.activityType),
              ),
            ),
            Positioned(
              bottom: 90,
              right: 20,
              child: ClipOval(
                child: Material(
                  color: Colors.white,
                  child: InkWell(
                    splashColor: AppColors.primaryColor.withOpacity(0.7),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset("assets/circle.png"),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    setMapPins();
    getDirections();
  }

  void setMapPins() {
    setState(() {
      // source pin
      _markers.add(
        Marker(
          markerId: const MarkerId('sourcePin'),
          position: SOURCE_LOCATION,
          icon: sourceIcon,
        ),
      );
      // destination pin
      _markers.add(
        Marker(
          markerId: const MarkerId('destPin'),
          position: DEST_LOCATION,
          icon: destinationIcon,
        ),
      );
    });
  }

  getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPIKey,
      PointLatLng(SOURCE_LOCATION.latitude, SOURCE_LOCATION.longitude),
      PointLatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      print("### ${result.errorMessage}");
    }
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }
}
