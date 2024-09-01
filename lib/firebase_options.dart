// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBxZlK6CxMeMAuvhRmpsxYmtKRIJhQcB7M',
    appId: '1:788592288416:android:ad44a0a1c8ee09b9951fc5',
    messagingSenderId: '788592288416',
    projectId: 'ad450-assessment-todo',
    storageBucket: 'ad450-assessment-todo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPDSBfXxILSOIhVaxOZTYZjotUCQanXDs',
    appId: '1:788592288416:ios:e579a52f5e085a4e951fc5',
    messagingSenderId: '788592288416',
    projectId: 'ad450-assessment-todo',
    storageBucket: 'ad450-assessment-todo.appspot.com',
    androidClientId: '788592288416-j9ua4brcqq58s9f2rrhh9kml17cfrlti.apps.googleusercontent.com',
    iosClientId: '788592288416-j0gding1n1lh9sh4kcopnqpglf4cq1hd.apps.googleusercontent.com',
    iosBundleId: 'com.example.ladder',
  );
}
