import 'package:flutter/material.dart';
import 'package:uber_clone_firebase/AllScreens/registerScreen.dart';

class LoginScreen extends StatelessWidget {
  static const String idScreen = "login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  height: 45,
                ),
                Image(
                    image: AssetImage("images/logo.png"),
                    height: 350,
                    width: 350,
                    alignment: Alignment.center),
                SizedBox(
                  height: 1.0,
                ),
                Text("Login as a Riders",
                    style: TextStyle(fontSize: 24, fontFamily: "Brand-Bold"),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 1.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(fontSize: 14.0),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0)),
                ),
                SizedBox(
                  height: 1.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(fontSize: 14.0),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0)),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  color: Colors.yellow,
                  textColor: Colors.white,
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: Text(
                      "Login",
                      style: TextStyle(fontSize: 18, fontFamily: "Brand-Bold"),
                    )),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  onPressed: () {
                    print("Loggedin button clicked");
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Do not have an Account?"),
                    FlatButton(
                      child: Text(
                        "Register Here.",
                        style: TextStyle(color: Colors.pink),
                      ),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, Registerscreen.idScreen, (route) => false);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
