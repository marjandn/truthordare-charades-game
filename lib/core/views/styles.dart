import 'package:flutter/material.dart';

class AppStyles {
  static Radius appDefaultRadius() => Radius.circular(15);

  static RoundedRectangleBorder rectangelRadiusPresseEffect = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  );

  static BorderRadius borderRadius = const BorderRadius.all(Radius.circular(15));

  static BorderRadius borderRoundedRadius = const BorderRadius.all(Radius.circular(18));
}
