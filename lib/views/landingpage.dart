import 'package:app_265cab/views/login.dart';
import 'package:app_265cab/views/signup.dart';
import 'package:colour/colour.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Image.asset(
        "assets/logo_trsp.png",
      width: 120.0,
      height: 120.0,
      alignment: Alignment.center,
    );

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/taxis.jpg"),
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
            padding: EdgeInsets.all(130),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                logo
              ],
            ),
          ),
        ),

        Padding(padding: EdgeInsets.only(
            top: 350.0,
        left: 40.0,
        right: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Welcome,", style: TextStyle(color: Colors.black, decoration: TextDecoration.none, fontSize: 40, fontFamily: "PTSerif Bold"),),
            SizedBox(height: 20),
            Text("We are all seeking convenience and reliability"
                " in all services, including transport. "
                "+265Cabs gives you just that; an opportunity to find and provide"
                " convenient, reliable cab services.", style: TextStyle(color: Colors.black, decoration: TextDecoration.none,
            fontSize: 20, fontFamily: "PTSerif Italic"),),
            SizedBox(height: 57.0,),

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                RaisedButton(
                    onPressed: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LogInScreen()),);
                    },
                  child: Text('Log In', style: TextStyle(color: Colors.black, fontSize: 20.0, fontFamily: 'PTSerif Bold'),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)
                  ),
                  color: Colour('#daa520'),
                  ),
                RaisedButton(
                  onPressed: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),);
                  },
                  child: Text('Sign Up', style: TextStyle(color: Colors.black, fontSize: 20.0, fontFamily: 'PTSerif Bold'),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)
                  ),
                  color: Colour('#daa520'),
                ),
              ],
            )
          ],
        ),
        )
      ],
      
    );
  }
}
