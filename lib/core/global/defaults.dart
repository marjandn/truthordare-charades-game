import 'package:flutter/services.dart';
import 'package:truth_or_dare/core/global/constants.dart';

class Defaults {
  static const platform = MethodChannel(Constants.platformChannelName);
  static const Duration defaultAnimDuration = Duration(milliseconds: 600);
}
