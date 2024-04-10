import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../global/constants.dart';
import '../global/defaults.dart';

getVersionCode() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String buildNumber = packageInfo.buildNumber;

  return buildNumber;
}

setForceLandscapeOritation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  if (GetPlatform.isIOS) {
    Defaults.platform.invokeListMethod(Constants.landscapeMethod);
  }
}

setForcePortrateOritation() {
  if (GetPlatform.isIOS) {
    Defaults.platform.invokeListMethod(Constants.portrateMethod);
  }
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}
