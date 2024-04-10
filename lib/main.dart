import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:truth_or_dare/core/injects/general_bindings.dart';
import 'package:truth_or_dare/core/views/app_theme.dart';
import 'package:truth_or_dare/games/main/main_dashboard_screen.dart';

//import 'firebase_options.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await GeneralBindings().dependencies();
  /*  await Firebase.initializeApp( TODO: uncomment htis section when you had initilized the firebase
    options: DefaultFirebaseOptions.currentPlatform,
  ); */
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);

    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("fa", "IR"),
      ],
      locale: const Locale("fa", "IR"),
      theme: AppTheme.lightThem().getTheme(),
      debugShowCheckedModeBanner: false,
      home: MainDashboardScreen(),
    );
  }
}
