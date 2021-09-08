import 'package:fb_login/google_login.dart';
import 'package:fb_login/login_page.dart';
import 'package:flutter/material.dart';

class FBMainPage extends StatefulWidget {
  FBMainPage({Key? key}) : super(key: key);

  @override
  _FBMainPageState createState() => _FBMainPageState();
}

class _FBMainPageState extends State<FBMainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("FB Login Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                minWidth: double.minPositive,
                height: 60,
                color: Colors.blue,
                onPressed: () {
                  Auth_Service().signOut();
                  print('SignOut');
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                      (route) => false);
                },
                child: Text(
                  'You are in FB Main Page',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
