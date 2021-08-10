import 'package:flutter/material.dart';

class SizeConfig {
  static double screenHeight = 0;
  static double screenWidth = 0;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static double textMultiplier = 0;
  static double imageSizeMultiplier = 0;
  static double heightMultiplier = 0;
  static double widthMultiplier = 0;

  void init(BoxConstraints constraints) {
    screenHeight = constraints.maxHeight;
    screenWidth = constraints.maxWidth;

    _blockWidth = screenWidth / 100;
    _blockHeight = screenHeight / 100;

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;
  }
}