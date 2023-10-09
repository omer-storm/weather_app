import 'package:flutter/material.dart';

Widget loader() {
  return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              color: Colors.amber,
            ),
          ]));
}
