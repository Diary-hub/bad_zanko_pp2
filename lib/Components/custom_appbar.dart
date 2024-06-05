// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';

AppBar CustomAppBar(String title, Color color, {TextStyle style = const TextStyle()}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: color,
    title: Text(
      title,
      style: style,
    ),
  );
}
