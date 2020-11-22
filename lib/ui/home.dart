import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:logisticsDriver/ui/HistoryPage.dart';
import 'package:logisticsDriver/ui/ProfilePage.dart';
import 'package:logisticsDriver/ui/tripPreview.dart';
import 'package:logisticsDriver/ui/walletPage.dart';
import 'package:logisticsDriver/utilities/assets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: HexColor("#E5E5E5"),
        drawer: Container(
            width: MediaQuery.of(context).size.width * 0.52,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          )),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 90,
                        child: CircleAvatar(
                        
                          child: Image.asset(Assets.circleAvatarS, scale: 0.6,)
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text('Oladapo \nMicheal',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 22,
                            color: Colors.black)),
                  ),
                ),
                //body
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HistoryPage(),
                        )),
                    child: Row(
                      children: [
                        Image.asset(Assets.history),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        Text(
                          'Your History',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WalletPage(),
                        )),
                    child: Row(
                      children: [
                        Image.asset(Assets.wallet),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        Text(
                          'Wallet',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Image.asset(Assets.settings),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.questionMark,
                          scale: 0.9,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        Text(
                          'Help',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Image.asset(Assets.exit),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        Text(
                          'Sign out',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
            // header

            ),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      scaffoldKey.currentState.openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      size: 50,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                   height: MediaQuery.of(context).size.height * 0.2,
                child: CircleAvatar(
                
                  child: Image.asset(Assets.circleAvatar, scale: 0.7,)
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.027,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Center(
                      child: Text(
                    "Azote Logistics",
                    style: TextStyle(color: Colors.red),
                  )),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text("Oladapo Micheal",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0))),
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Text(
                            "Notifications",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Image.asset(Assets.dot),
                      ],
                    ),
                      SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:28.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.035,
                  width: MediaQuery.of(context).size.width*0.075,
                    decoration: BoxDecoration(
                       color: HexColor("#D5EBFB"),
                      borderRadius: BorderRadius.circular(10),
                      
                    ),
                    child: Center(child: Image.asset(Assets.belll)),
                  ),
                ),
                Column(
                  children: [
                    GestureDetector(
                       onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TripPreview(),
                        )),
                                          child: Container(
                          width: MediaQuery.of(context).size.width*0.8,
                        child: Text("You Accepted a Delivery request",style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,fontSize: 20),)),
                    ),
                     SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.8,
                      child: Text("1h ago"))
                  ],
                )
              ],),
             SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
               Row(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:28.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.035,
                  width: MediaQuery.of(context).size.width*0.075,
                    decoration: BoxDecoration(
                       color: HexColor("#D5EBFB"),
                      borderRadius: BorderRadius.circular(10),
                      
                    ),
                    child: Center(child: Image.asset(Assets.checkk)),
                  ),
                ),
                Column(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width*0.8,
                      child: Text("You completed a delivery request",style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,fontSize: 20),)),
                    Container(
                      width: MediaQuery.of(context).size.width*0.8,
                      child: Text("1day ago"))
                  ],
                )
              ],),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
