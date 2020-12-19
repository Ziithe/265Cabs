import 'package:app_265cab/views/Home.dart';
import 'package:colour/colour.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:app_265cab/main.dart';

class SignUpScreen extends StatefulWidget{
  @override
  _CreateSignUpState createState() => _CreateSignUpState();
}

class _CreateSignUpState extends State<SignUpScreen> {
  bool _checked = false;
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbRef =
      FirebaseDatabase.instance.reference().child("Users");

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordMatch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/girls-whitebg.jpg"),
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
              height: 500.0,
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
                children: [
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Create New Account', style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: 'PTSerif Bold',
                          decoration: TextDecoration.none,
                        ),
                        ),
                        SizedBox(height: 10.0,),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(hintText: 'Full Name', focusColor: Colors.black),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'PTSerif Italic'
                          ),
                          // ignore: missing_return
                          validator: (value){
                            if (value.isEmpty){
                              return 'Please enter your Full Name';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(hintText: 'Email Address', focusColor: Colors.black),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'PTSerif Italic'
                          ),
                          validator: (value){
                            if (value.isEmpty){
                              return 'Please enter your email address';
                            }
                            else if (!value.contains('@')) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(hintText: 'Phone Number', focusColor: Colors.black),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'PTSerif Italic'
                          ),
                        ),
                        TextFormField(
                          controller: userController,
                          decoration: InputDecoration(hintText: 'User Type', focusColor: Colors.black),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'PTSerif Italic'
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(hintText: 'Password', focusColor: Colors.black),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'PTSerif Italic'
                          ),
                          validator: (value){
                            if (value.isEmpty){
                              return 'Please enter your Password';
                            }
                            else if (value.length < 6){
                              return 'Password must be at least 6 characters!';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: passwordMatch,
                          decoration: InputDecoration(hintText: 'Confirm Password', focusColor: Colors.black),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'PTSerif Italic'
                          ),
                          validator: (value){
                            // ignore: unrelated_type_equality_checks
                            if(value != passwordController){
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: <Widget>[
                            Checkbox(
                              activeColor: Colour("daa520"),
                              value: _checked,
                              onChanged: (value) {
                                setState(() {
                                  _checked = !_checked;
                                });
                              },
                            ),
                            Text('I agree to all the terms and conditions.',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontFamily: 'PTSerif BoldItalic'
                              ),)
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: isLoading
                          ? CircularProgressIndicator()
                          : RaisedButton(
                              color: Colour('daa520'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              onPressed: () {
                                if (_formKey.currentState.validate()){
                                  setState(() {
                                    isLoading = true;
                                  });
                                  registerToFb();
                                }
                                },
                                child: Text('Sign Up', style: TextStyle(color: Colors.black, fontSize: 20.0, fontFamily: 'PTSerif Bold'),
                                ),
                              ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.all(10),
            ),
          ),
          Padding(padding: EdgeInsets.only(
            left: 40.0,
            top: 700.0,
            right: 40.0,
          ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 15.0,),
                Text("Already have an account?", style: TextStyle(color: Colors.black54, fontSize: 20.0, fontFamily: 'PTSerif BoldItalic')),
                Text("Log in here", style: TextStyle(color: Colors.black, fontSize: 20.0, fontFamily: 'PTSerif BoldItalic', decoration: TextDecoration.underline))
              ],
            ),)
        ],
      ),
    );
  }

  void registerToFb() {
    firebaseAuth.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text)
        .then((result) {
      dbRef.child(result.user.uid).set({
        "email": emailController.text,
        "name": nameController.text
      }).then((res) {
        isLoading = false;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home(uid: result.user.uid)),
        );
      });
    }).catchError((err) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    userController.dispose();
    passwordMatch.dispose();
  }
}
