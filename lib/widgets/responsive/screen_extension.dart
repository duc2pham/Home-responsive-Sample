import 'package:flutter/material.dart';

extension ScreenExtension on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeight => MediaQuery.sizeOf(this).height;

  bool get isPortrait => screenWidth < screenHeight;

  double get aspectRatio =>
      isPortrait ? screenHeight / screenWidth : screenWidth / screenHeight;

  double get shortestSide => MediaQuery.sizeOf(this).shortestSide;
  double get longestSide => MediaQuery.sizeOf(this).longestSide;
}
