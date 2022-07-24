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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAkUVxhpzHSSfimiJKP6uzzuZJqbMy2UWk',
    appId: '1:711690558035:web:5fb96aca410de1645644a6',
    messagingSenderId: '711690558035',
    projectId: 'infosumbar-a0bd6',
    authDomain: 'infosumbar-a0bd6.firebaseapp.com',
    storageBucket: 'infosumbar-a0bd6.appspot.com',
    measurementId: 'G-ZMDH6HQBRT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCvmZ8nLxhb1TylbetLLMRkSzutq_gKVU4',
    appId: '1:711690558035:android:2d16c33a65991df65644a6',
    messagingSenderId: '711690558035',
    projectId: 'infosumbar-a0bd6',
    storageBucket: 'infosumbar-a0bd6.appspot.com',
  );
}