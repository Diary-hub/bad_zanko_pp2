import 'package:flutter/material.dart';

AppBar newMethod(String title) {
  return AppBar(
    backgroundColor: Colors.amber,
    centerTitle: true,
    title: Text(title),
  );
}
