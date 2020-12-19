import 'package:colour/colour.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/girl_in_orange.jpg"),
                  fit: BoxFit.cover,
                ),
              )
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.4),
                    Colors.white70.withOpacity(0.7),
                  ],
                  stops: [0.0, 1],
                  begin: Alignment.topCenter,
                )
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: EdgeInsets.all(120),

              child: Column(
                  children: <Widget>[
                    Image(image: AssetImage("assets/logo_trsp.png"),
                      width: 120.0,
                      height: 120.0,
                      alignment: Alignment.center,)
                  ]
              ),
            ),
          ),
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
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Log in to your account', style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: 'PTSerif Bold',
                    decoration: TextDecoration.none,
                  ),
                  ),
                  SizedBox(height: 10.0,),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value)
                    {
                      if(value.isEmpty || !value.contains('@'))
                        {
                          return 'invalid email address';
                        }
                      return null;
                    },
                    onSaved: (value)
                    {

                    },
                    decoration: InputDecoration(hintText: 'Email Address', focusColor: Colors.black),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'PTSerif Italic'
                    ),

                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Password', focusColor: Colors.black),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'PTSerif Italic'
                    ),
                  ),
                  SizedBox(height: 10,),
                ],
              ),
              padding: EdgeInsets.all(10),
            ),
          ),
          Padding(padding: EdgeInsets.only(
            left: 40.0,
            top: 500.0,
            right: 40.0,
          ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[Container(
                    padding: EdgeInsets.symmetric(
                      vertical:8.0,
                      horizontal: 30.0,
                    ),
                    decoration:BoxDecoration(
                        color: Colour('#daa520'),
                        borderRadius: BorderRadius.circular(50.0)
                    ),
                    child: Text('Log In', style: TextStyle(color: Colors.black, fontSize: 20.0, fontFamily: 'PTSerif Bold'),
                    ),
                  ),
                  ],
                ),
                SizedBox(height: 15.0,),
                Text("Or log in with", style: TextStyle(color: Colors.black54, fontSize: 20.0, fontFamily: 'PTSerif BoldItalic')),
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.facebook),
                    SizedBox(width: 20,),
                    Icon(FontAwesomeIcons.googlePlus)
                  ],
                ),
                SizedBox(height: 20.0,),
                Text("Forgot Password?", style: TextStyle(color: Colors.black, fontSize: 20.0, fontFamily: 'PTSerif BoldItalic', decoration: TextDecoration.underline))
              ],
            ),)
        ],
      ),
    );
  }
}
