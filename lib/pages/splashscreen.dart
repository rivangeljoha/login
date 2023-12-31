import 'dart:async';

import 'package:flutter/material.dart';
import 'package:senaflutter/constants/constants.dart';


class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(SIGN_IN);
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/images/logo-sena-verde.png',
                width: animation.value * 250,
                height: animation.value * 250,
                
              ),
              SizedBox(height: 45),
              Text(
                'SENA', 
                style: TextStyle(
                  color: Colors.green,fontSize: 40,fontWeight: FontWeight.bold
                  ),
              ),
              SizedBox(height: 30),
              Text('Una entidad de clase mundial',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,)
                  )

            ],
          ),
        ],
      ),
    );
  }
}