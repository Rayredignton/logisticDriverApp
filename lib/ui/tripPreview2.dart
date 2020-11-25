import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:logisticsDriver/core/services/methods.dart';
import 'package:logisticsDriver/ui/tripPreview3.dart';
import 'package:logisticsDriver/utilities/assets.dart';

class TripPreview2 extends StatefulWidget {
  @override
  _TripPreview2State createState() => _TripPreview2State();
}

class _TripPreview2State extends State<TripPreview2> {
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
    return SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
                  child: Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height*0.5,
              child: GoogleMap(
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
            ),
            Padding(
              padding: const EdgeInsets.only(top:408.0),
              child: Container(
                
                 decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0))),
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top:38.0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(Assets.clock),
                            SizedBox(  width: MediaQuery.of(context).size.width*0.02,),
                            Text("2 mins away",style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),),
                          
                         
                      
                          ],
                        ),
                      ),
                        SizedBox(   height: MediaQuery.of(context).size.height * 0.05,),
                       Row(
                        
                         children: [
                           Container(
                             width: MediaQuery.of(context).size.width * 0.3,
                            height: 100,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[700],
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 60,
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
                        SizedBox(   width: MediaQuery.of(context).size.width * 0.1,),
                        Image.asset(Assets.phone),
                         SizedBox(   width: MediaQuery.of(context).size.width * 0.05,),
                        Image.asset(Assets.comment),
                         ],
                       ),
                        
                         SizedBox(   height: MediaQuery.of(context).size.height * 0.05,),
                         Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.85,
                          decoration: BoxDecoration(
                              border: Border.all(color: HexColor("#E0E3FB")),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 0,
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    color: Colors.black.withOpacity(0.25)),
                              ],
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Column(
                            children: [
                            SizedBox(   height: MediaQuery.of(context).size.height * 0.02,),
                              Center(
                                child: Row(
                                  children: [
                                    SizedBox(  width: MediaQuery.of(context).size.width*0.04,),
                                    Text(
                                      "Delivery type:",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: HexColor("#959595")),
                                    ),
                                      SizedBox(  width: MediaQuery.of(context).size.width*0.02,),
                                    Text(
                                      "Bulk delivery",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: HexColor("#2094E9")),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                             SizedBox(   height: MediaQuery.of(context).size.height * 0.05,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:35.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TripPreview3(),
                                    )),
                                child: Image.asset(Assets.start,scale: 0.8,)),
                               
                            ],),
                          )
                    ],),
              ),
            )
          ],),
        ),
        
      ),
    );
  }
}