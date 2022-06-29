import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmayinnovatest/constants.dart';
import 'package:fmayinnovatest/views/home.dart';

int id = 0;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool topico = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          padding: EdgeInsetsDirectional.all(4.0),
          middle: Image.asset("lib/assets/mercedes_logo.png"),
        ),
        // resizeToAvoidBottomInset: true,
        child: SafeArea(
          child: Container(
            width: size.width,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: topico ? 0 : 90),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80.0, vertical: 32.0),
                      child: Text(
                        "Login",
                        style: innovatestH3Blue,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 28.0,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 28.0),
                      child: Text(
                        "Enter user ID",
                        style: innovatestH1Black,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 10.0),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: CupertinoTextField(
                        padding: EdgeInsets.all(12.0),
                        onChanged: (value) => id = value as int,
                        cursorColor: primaryColor,
                        keyboardType: TextInputType.number,
                        prefix: Container(
                            height: 20.0,
                            margin: EdgeInsets.only(left: 12.0),
                            child: Icon(Icons.person)),
                        // placeholder: "Usuario",
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: greyLightColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 16.0),
                  child: Container(
                    width: double.infinity,
                    child: CupertinoButton(
                      color: secondaryColor,
                      // padding: EdgeInsets.symmetric(horizontal: size.width * 0.25),
                      child: Text("Login"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
