import 'package:flutter/cupertino.dart';
import 'package:logisticsDriver/core/models/address.dart';


class AppData extends ChangeNotifier {
  Address pickUpLocation;
  
  void updatePickUpLocation(Address pickUpAddress)
  
   {
    pickUpLocation = pickUpAddress;
    notifyListeners();
  }
}
