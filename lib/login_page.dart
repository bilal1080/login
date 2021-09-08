import 'package:fb_login/fb_main.dart';
import 'package:fb_login/google_login.dart';
import 'package:fb_login/main_page.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        home: Home(),
      routes: {
        "/mainpage": (_) => new MainPage(),
        "/fbmainpage": (_) => new FBMainPage(),
      },

    );
  }

}
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                minWidth: double.minPositive,
                height: 60,
                color: Colors.red,
                onPressed: () {
                  SignInGoogleUser();
                },
                child: Text(
                  'Google Login',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              MaterialButton(
                minWidth: double.minPositive,
                height: 60,
                color: Colors.lightBlue,
                onPressed: () {
                  SignInfbUser();
                },
                child: Text(
                  'Facebook Login',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ],
          ),
        ),
      );
  }
  // ignore: non_constant_identifier_names
  void SignInGoogleUser() async {
    dynamic authResult = await Auth_Service().signInWithGoogle();
    if (authResult == null) {
      print("Sorry>>>>>>>>>...");
    } else {
      print("SignIn SuccessFull");
      Navigator.pushReplacementNamed(context, "/mainpage");
    }
  }
  // ignore: non_constant_identifier_names
  void SignInfbUser() async {
    dynamic authResult = await Auth_Service().signInWithFacebook();
    if (authResult == null) {
      print("Sorry>>>>>>>>>...");
    } else {
      print("SignIn SuccessFull");
      Navigator.pushReplacementNamed(context, "/fbmainpage");
    }
  }
}
