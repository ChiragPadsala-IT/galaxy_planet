import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galaxy_planet/models/details_list.dart';
import 'package:galaxy_planet/models/planet_details_class.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  static List fetchData;
  static AnimationController _controller;
  static Animation _animation;

  List fetchDataFunc() {
    return planetDetails.map((e) => Planets.from(e)).toList();
  }

  @override
  void initState() {
    fetchData = fetchDataFunc();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 20000));
    _animation = Tween<double>(begin: 0,end: pi*2).animate(_controller);
    _controller.forward();
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white24,
        appBar: AppBar(
          leading: Icon(Icons.menu),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: (){}),
          ],
          backgroundColor: Colors.white24,
          elevation: 0,
          title: Text("Galaxy Planet"),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed("/details_screen",arguments: fetchData[index]);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 5,
                            top: 10,
                            right: 10),
                        height: 200,
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 9),
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      fetchData[index].planetName,
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.white),
                                    ),
                                    Text(
                                      "Milkyway Galaxy",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white24),
                                    ),
                                    SizedBox(height: 2),
                                    Container(
                                      height: 3,
                                      width: MediaQuery.of(context).size.width /
                                          12,
                                      color: Colors.blueAccent,
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.more_vert,
                                  color: Colors.white24,
                                  size: 30,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/ic_distance.png",
                                      color: Colors.white24,
                                      height: 20,
                                    ),
                                    Text(
                                      fetchData[index].distanceToSun,
                                      style: TextStyle(color: Colors.white24),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "assets/images/ic_gravity.png",
                                      color: Colors.white24,
                                      height: 20,
                                    ),
                                    Text(
                                      fetchData[index].gravity + " m/s",
                                      style: TextStyle(
                                        color: Colors.white24,
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
                    ),
                    Container(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RotationTransition(
                            turns: _animation,
                            child: Hero(
                              tag: fetchData[index].planetName,
                              child: Image.asset(
                                fetchData[index].planetImage,
                                height: 120,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: fetchData.length,
          ),
        ),
      ),
    );
  }
}
