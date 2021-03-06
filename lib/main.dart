import 'package:flutter/material.dart';
import 'package:logisticsDriver/core/Provider/AppData.dart';
import 'package:logisticsDriver/ui/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
   Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
          child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,

      
        home: Home(),
      ),
    );
  }
}
