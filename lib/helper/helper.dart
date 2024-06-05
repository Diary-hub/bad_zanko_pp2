import 'package:flutter/material.dart';

class HelperClass {
  static Color getColor(bool isFemale) {
    return isFemale ? Colors.pinkAccent : Colors.cyan;
  }

  static String getImage(bool isFemale) {
    return isFemale
        ? "https://cdn-icons-png.flaticon.com/512/264/264735.png"
        : "https://cdn.iconscout.com/icon/free/png-256/free-man-person-avatar-user-boy-32054.png";
  }
}
