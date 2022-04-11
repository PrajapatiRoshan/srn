import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:srn/homePage.dart';

class map extends StatefulWidget {
  //stful
  String name;
  map(this.name);

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
  late GoogleMapController _googleMapController;
  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);
  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar("${widget.name}"),
        body: GoogleMap(
            initialCameraPosition: initialCameraPosition,
            markers: markers,
            zoomControlsEnabled: true,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              _googleMapController = controller;
            },
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          extendedTextStyle: TextStyle(color: Colors.white, fontSize: 24),
          onPressed: () async {
            Position position = await _determinePosition();

            _googleMapController.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: LatLng(position.latitude, position.longitude),
                    zoom: 14)));

            markers.clear();

            markers.add(Marker(
                markerId: const MarkerId('currentLocation'),
                position: LatLng(position.latitude, position.longitude)));

            setState(() {});
          },
          label: const Text("Current Location"),
          icon: const Icon(
            Icons.location_history,
          ),
        ),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}

AppBar _appBar(name) {
  return AppBar(
    title: Text(name),
    elevation: 0,
    backgroundColor: Colors.black,
    actions: [
      InkWell(
        onTap: (){Get.to(HomeScreen());},
        child:Icon(Icons.near_me),
      )
    ],
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
    titleSpacing: 20,
  );
}
