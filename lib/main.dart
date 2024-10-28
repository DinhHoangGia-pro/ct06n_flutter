import 'package:flutter/material.dart';
import 'package:helloworld/ListProducts.dart';
import 'package:helloworld/MainScreen.dart';
import 'package:helloworld/MyStatefulWidget.dart';
import 'package:helloworld/MyStatelessWidget.dart';

void main() {
  // HttpOverrides.global = new MyHttpOverrides();

  runApp(MaterialApp(
    home: MainScreen(),
  ));
}
