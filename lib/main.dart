import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'Utill/app_colors.dart';
import 'jswApp.dart';
ValueNotifier<Color> appBarColorNotifier = ValueNotifier<Color>(AppColors.yellow);

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: AppColors.primaryColor,
    //   statusBarBrightness: Brightness.dark,
    //   statusBarIconBrightness: Brightness.light,
    // ));

  //  await Firebase.initializeApp();

    runApp(JswApp());
  },(error, stack) {
   // FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  });


}



class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}