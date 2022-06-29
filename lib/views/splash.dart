import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmayinnovatest/constants.dart';
import 'package:fmayinnovatest/views/home.dart';
import 'package:fmayinnovatest/views/login.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future<Timer> loadData() async {
    return Timer(
        Duration(seconds: 3, milliseconds: 0, microseconds: 0), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => id != 0 ? const Home() : Login(),
        ),
        (route) => false);
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "lib/assets/mercedes_logo.png",
              height: 333,
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              "fmay innovatest",
              style: innovatestH2Blue,
            ),
          ],
        ),
      ),
    );
  }
}
