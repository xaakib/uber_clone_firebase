import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uber_clone_firebase/AllScreens/loginScreen.dart';

class Registerscreen extends StatelessWidget {
  static const String idScreen = "register";

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20,
                ),
                Image(
                    image: AssetImage("images/logo.png"),
                    height: 350,
                    width: 350,
                    alignment: Alignment.center),
                SizedBox(
                  height: 1.0,
                ),
                Text("Register as Rider",
                    style: TextStyle(fontSize: 24, fontFamily: "Brand-Bold"),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 1.0,
                ),
                TextField(
                  controller: nameTextEditingController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(fontSize: 14.0),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0)),
                ),
                SizedBox(
                  height: 1.0,
                ),
                TextField(
                  controller: emailTextEditingController,
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
                  controller: phoneTextEditingController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Phone",
                      labelStyle: TextStyle(fontSize: 14.0),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0)),
                ),
                SizedBox(
                  height: 1.0,
                ),
                TextField(
                  controller: passwordTextEditingController,
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
                      "Create Account",
                      style: TextStyle(fontSize: 18, fontFamily: "Brand-Bold"),
                    )),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  onPressed: () {
                    if (nameTextEditingController.text.length < 4) {
                      displayToastMassage(
                          "name must be atlast 3 Characters", context);
                    }
                    if (!emailTextEditingController.text.contains("@")) {
                      displayToastMassage(
                          "Email Address is not Valid", context);
                    }
                    if (phoneTextEditingController.text.isEmpty) {
                      displayToastMassage("Phone number is mandatory", context);
                    }
                    if (passwordTextEditingController.text.length < 7) {
                      displayToastMassage(
                          "Password must be atlast 6 Charactars", context);
                    } else {
                      registernewuser(context);
                    }
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
                        "Login Here.",
                        style: TextStyle(color: Colors.pink),
                      ),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, LoginScreen.idScreen, (route) => false);
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

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  registernewuser(BuildContext context) async {
    final User firebaseUser =
        (await _firebaseAuth.createUserWithEmailAndPassword(
      email: emailTextEditingController.text,
      password: passwordTextEditingController.text,
    ))
            .user;

    if (firebaseUser != null) {
      //user created

      //save user info to database
    } else {
      //error occured - display error msg
    }
  }

  displayToastMassage(String massage, BuildContext context) {
    Fluttertoast.showToast(msg: massage);
  }
}
