import 'package:flutter/material.dart';

class SizeConfig {
  static getHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  static getWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  static getDevice(context) {
    if (MediaQuery.of(context).size.width > 600) {
      return false;
    } else {
      return true;
    }
  }
}