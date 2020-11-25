import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:logisticsDriver/core/services/methods.dart';
import 'package:logisticsDriver/utilities/assets.dart';

class TripPreview3 extends StatefulWidget {
  @override
  _TripPreview3State createState() => _TripPreview3State();
}

class _TripPreview3State extends State<TripPreview3> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controllerGoogleMap = Completer();

  GoogleMapController newGoogleMapController;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Position currentPosition;
  var geolocator = Geolocator();
  double bottomPaddingOfMap = 0;

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
    return SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
                  child: Column(children: [
             Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      GoogleMap(
                        myLocationEnabled: true,
                        zoomControlsEnabled: true,
                        myLocationButtonEnabled: true,

                        initialCameraPosition: _kGooglePlex,
                        zoomGesturesEnabled: true,
                        mapType: MapType.normal,

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
                     
                      
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 38.0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.18,
                            width: MediaQuery.of(context).size.width * 0.96,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Column(children: [
                                  SizedBox(   height: MediaQuery.of(context).size.height * 0.014,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:25.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                      Text("Your Delivery",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                                      Container(
                                         height: MediaQuery.of(context).size.height * 0.04,
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                                color: HexColor("#2945FF"),
                                borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                                      child: Center(child: Text("View",style:TextStyle(color: Colors.white,fontSize: 15))),
                                      )
                                    ],),
                                  ),
                                  SizedBox(   height: MediaQuery.of(context).size.height * 0.02,),
                       Row(
                        
                         children: [
                           Container(
                             width: MediaQuery.of(context).size.width * 0.2,
                            height: 50,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[700],
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            ),
                           
                        Container(
                          child: Text('Stephanie Yeboha',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 22,
                              color: Colors.black)),


                        ),
                        SizedBox(   width: MediaQuery.of(context).size.width * 0.2,),
                        Image.asset(Assets.phone),
                         SizedBox(   width: MediaQuery.of(context).size.width * 0.05,),
                        Image.asset(Assets.comment),
                         ],
                       ),
                       Container(
                         width: MediaQuery.of(context).size.width * 0.55,
                         child: Text("Bulk delivery",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),))
                            ],)
                          ),
                        ),
                      ),
                      // Spacer()
                    ],
                  ),
                ),
          ],),
        ),
      ),
    );
  }
}