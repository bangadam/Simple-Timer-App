import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyAppState();
  }
}

class MyAppState extends State {
  static const duration = const Duration(seconds: 1);

  int secondPassed = 0;
  bool isActive = false;

  Timer timer;

  void handleTick() {
    if (isActive) {
      setState(() {
        secondPassed = secondPassed + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    }

    int seconds = secondPassed % 60;
    int minutes = secondPassed ~/ 60;
    int hours = secondPassed ~/ (60 * 60);

    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Timer'),
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 50),
                      child: Text("Simple Timer App",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomTextContainer(
                      label: "Hours",
                      value: hours.toString().padLeft(2, '0'),
                    ),
                    CustomTextContainer(
                      label: "Minutes",
                      value: minutes.toString().padLeft(2, '0'),
                    ),
                    CustomTextContainer(
                      label: "Second",
                      value: seconds.toString().padLeft(2, '0'),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: RaisedButton(
                      child: Text(isActive ? 'STOP' : 'START'),
                      onPressed: () {
                        setState(() {
                          isActive = !isActive;
                        });
                      },
                    )),
              ],
            ),
          )),
    );
  }
}

class CustomTextContainer extends StatelessWidget {
  final String label;
  final String value;

  const CustomTextContainer({this.label, this.value});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(20),
      decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(10), color: Colors.lightBlue),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '$value',
            style: TextStyle(
                color: Colors.white, fontSize: 54, fontWeight: FontWeight.bold),
          ),
          Text(
            '$label',
            style: TextStyle(color: Colors.white70),
          )
        ],
      ),
    );
  }
}
