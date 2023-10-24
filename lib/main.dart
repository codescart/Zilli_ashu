import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'Screen/Constant Data/constant.dart';
import 'Screen/Splash Screen/splash_screen.dart';

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = kMainColor
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zilli Cash',
      theme: ThemeData(fontFamily: 'Display'),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}
