import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ladder/core/app/app.locator.dart';
import 'package:ladder/core/app/app.supabase.client.dart';
import 'package:ladder/features/startup.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await Hive.initFlutter();

    await initializeSupabase();
    setupLocator();
  } catch (e) {
    debugPrint(e.toString());
  }
  runApp(const Ladder());
}
