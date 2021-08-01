import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('loginpage/');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.dstATop),
            image: AssetImage("assets/mihai-moisa-Djtc1T38-GY-unsplash.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              height: 200,
              width: 200,
              // alignment: Alignment.topCenter,
              image: AssetImage('assets/logo5.png'),
            ),
            SizedBox(
              height: 30,
            ),
            CircularProgressIndicator(
              backgroundColor: Color(0xffffba08),
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Text(
                  'ALL YOUR FAVOURITE IS HERE',
                  style: TextStyle(
                    color: Color(0xff9ef01a),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'varela',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'DEVELOPED BY:- JAY KHODIYAR INVESTORS',
                  style: TextStyle(
                    color: Color(0xffffff3f),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'nunito',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
