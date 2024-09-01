import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ladder/core/app/app.locator.dart';
import 'package:ladder/features/startup.dart';
import 'package:ladder/firebase_options.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));

    await Hive.initFlutter();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    setupLocator();
  } catch (e) {
    debugPrint(e.toString());
  }
  runApp(const Ladder());
}
