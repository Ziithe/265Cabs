import 'package:colour/colour.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Profile extends StatelessWidget {
  Profile({this.uid});
  final String uid;
  final String title = "My Profile";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            title, style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontFamily: 'PTSerif Bold',
            decoration: TextDecoration.none,
          ),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ),
        body: Material(
          child: Stack(
            children: [
        Container(
        decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/taxi.jpg"),
        fit: BoxFit.cover,
      ),
    )
    ),
    Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    colors: [
      Colors.white.withOpacity(0.8),
      Colors.white70.withOpacity(0.8),
    ],
    stops: [0.0, 1],
    begin: Alignment.topCenter,
    )
    ),
    ),
              Column(
                children: <Widget>[
                  SizedBox(
                      height: 50.0
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 130.0,
                        width: 130.0,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(65.0),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3.0,
                                  offset: Offset(0, 4.0),
                                  color: Colors.grey
                              ),
                            ]
                        ),
                        child: IconButton(
                          padding: EdgeInsets.only(top: 100, left: 80),
                            icon: Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
                  Padding(padding: EdgeInsets.only(top: 200, left: 140),
                  child: Row(
                    children: <Widget>[
                      Text('Dzina Langa',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: 'PTSerif Bold',
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
    ),),
                  Padding(padding: EdgeInsets.only(
    top: 250,
    left: 40,
    right: 40),
    child: Container(
    height: 200.0,
    width: 600.0,
    decoration: BoxDecoration(
    gradient: LinearGradient(
    colors: [
    Colour("#daa520", 0.5),
    Colour('#daa520', 0.5)
    ],
    stops: [0.0, 1],
    begin: Alignment.topCenter,
    )
    ),),
    ),
          ],
          ),
        ),
    );
  }
}
