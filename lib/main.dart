import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmayinnovatest/constants.dart';
import 'package:fmayinnovatest/views/splash.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: CupertinoColors.extraLightBackgroundGray,
    // fontFamily: "Roboto",
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: primaryColor,
    accentColor: secondaryColor,
    hintColor: secondaryColor,
    errorColor: dangerColor,
    highlightColor: successColor,
    backgroundColor: bgLightColor,
    // errorColor: episode666Color,
  );
}

CupertinoThemeData ctheme() {
  return CupertinoThemeData(
    primaryColor: primaryColor,
    textTheme: CupertinoTextThemeData(
      primaryColor: secondaryColor,
    ),
  );
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Innovation Test',
      debugShowCheckedModeBanner: false,
      theme: ctheme(),
      home: Splash(),
    );
  }
}
