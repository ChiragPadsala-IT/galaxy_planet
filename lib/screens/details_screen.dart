import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galaxy_planet/models/planet_details_class.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with SingleTickerProviderStateMixin {
  static AnimationController _controller;
  static Animation _animation;
  GlobalKey<ScaffoldState> _myScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 20000));
    _animation = Tween<double>(begin: 0, end: pi * 2).animate(_controller);
    _controller.forward();
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget myOverview(Planets obj){
    return Container(
      color: Colors.indigo[900],
      padding: EdgeInsets.only(
          top: 0, left: 15, right: 10, bottom: 0),
      height: double.maxFinite,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 170,
            ),
            Text(
              "OVERVIEW\n",
              style: TextStyle(
                  fontSize: 24, color: Colors.white60),
            ),
            Text(
              obj.overView,
              style: TextStyle(
                  fontSize: 18, color: Colors.white60),
            ),
          ],
        ),
      ),
    );
  }

  Widget backButton(){
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
            Size(MediaQuery.of(context).size.width, 50)),
        shape: MaterialStateProperty.all(ContinuousRectangleBorder()),
        overlayColor:
        MaterialStateColor.resolveWith((states) => Colors.white10),
        shadowColor:
        MaterialStateColor.resolveWith((states) => Colors.black26),
        alignment: Alignment.centerRight,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(
        "< BACk\t\t\t ",
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget centerDecoration(obj){
    return Align(
      alignment: Alignment.center,
      heightFactor: 2.3,
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsets.symmetric(horizontal: 40),
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.only(top: 70),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.indigo[900],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(5, 5),
                    color: Colors.black26,
                    blurRadius: 1,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    obj.planetName,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Text(
                    "Milkyway Galaxy",
                    style: TextStyle(fontSize: 15, color: Colors.white60),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 3,
                    width: 30,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/ic_distance.png",
                            color: Colors.white60,
                            height: 24,
                          ),
                          Text(
                            "\t${obj.distanceToSun}",
                            style: TextStyle(
                                color: Colors.white60, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/ic_gravity.png",
                            color: Colors.white60,
                            height: 24,
                          ),
                          Text(
                            "\t${obj.gravity}" + " m/s",
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "2",
                            style: TextStyle(
                                fontSize: 10, color: Colors.white24),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                _myScaffoldKey.currentState.showBottomSheet(
                      (context) => myBottomSheet(obj),
                  backgroundColor: Colors.indigo[900],
                );
              },
              child: Container(
                margin: EdgeInsets.only(top: 50),
                padding: EdgeInsets.only(top: 70),
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotationTransition(
                  turns: _animation,
                  child: Image.asset(
                    obj.planetImage,
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget myBottomSheet(Planets obj){
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      alignment: Alignment.center,
      color: Colors.black54,
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: double.maxFinite,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              "Welcome To ${obj.planetName}",
              style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 24,
                  letterSpacing: 2),
            ),
          ),
          RotationTransition(
              turns: _animation,
              child: Image.asset(
                obj.planetImage,
                height: 100,
                width: 100,
              )),
          Column(
            children: [
              Text(
                "Distance to Sun",
                style: TextStyle(
                    color: Colors.white54, fontSize: 24),
              ),
              SizedBox(height: 5),
              Text(
                obj.distanceToSun,
                style: TextStyle(
                    color: Colors.white54, fontSize: 18),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "Distance to Earth",
                style: TextStyle(
                    color: Colors.white54, fontSize: 24),
              ),
              SizedBox(height: 5),
              Text(
                obj.distanceToEarth,
                style: TextStyle(
                    color: Colors.white54, fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    Planets obj = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      key: _myScaffoldKey,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(obj.surfaceImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Container(
                    color: Colors.black38,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    myOverview(obj),
                  ],
                ),
              ),
            ],
          ),
          centerDecoration(obj),
        ],
      ),
      bottomNavigationBar: backButton(),
    );
  }
}