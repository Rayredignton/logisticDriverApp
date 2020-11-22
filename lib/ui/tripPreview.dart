import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logisticsDriver/core/services/methods.dart';

class TripPreview extends StatefulWidget {
  @override
  _TripPreviewState createState() => _TripPreviewState();
}

class _TripPreviewState extends State<TripPreview> {
   Completer<GoogleMapController> _controllerGoogleMap = Completer();
  double bottomPaddingOfMap = 0;

  GoogleMapController newGoogleMapController;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  Position currentPosition;
  var geolocator = Geolocator();

  void locatePosition() async {
    Position position = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLatPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        CameraPosition(target: latLatPosition, zoom: 15);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    String address = await Methods.searchCoordinateAddress(position, context);
    print("This is your address::" + address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        GoogleMap(
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: true,

                initialCameraPosition: _kGooglePlex,
                zoomGesturesEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  _controllerGoogleMap.complete(controller);
                  newGoogleMapController = controller;
                  setState(() {
                    bottomPaddingOfMap = 300.0;
                  });
                  locatePosition();
                },
                //  markers: Set<Marker>.of(markers),
              ),
      ],),
      
    );
  }
}