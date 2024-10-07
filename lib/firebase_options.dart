// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDueY8HCXnINdssO_Lst0L078Vhl66Apfw',
    appId: '1:1053052441768:web:95036171166f64890a1e9d',
    messagingSenderId: '1053052441768',
    projectId: 'expense-c0944',
    authDomain: 'expense-c0944.firebaseapp.com',
    storageBucket: 'expense-c0944.appspot.com',
    measurementId: 'G-ZBWE5S3G0L',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBKWrC6jYBNjNaJ-2cs2Y1hnnU4uVVeRLo',
    appId: '1:1053052441768:ios:747001c3af1027e90a1e9d',
    messagingSenderId: '1053052441768',
    projectId: 'expense-c0944',
    storageBucket: 'expense-c0944.appspot.com',
    iosBundleId: 'com.example.expenseTackerApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBKWrC6jYBNjNaJ-2cs2Y1hnnU4uVVeRLo',
    appId: '1:1053052441768:ios:747001c3af1027e90a1e9d',
    messagingSenderId: '1053052441768',
    projectId: 'expense-c0944',
    storageBucket: 'expense-c0944.appspot.com',
    iosBundleId: 'com.example.expenseTackerApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDueY8HCXnINdssO_Lst0L078Vhl66Apfw',
    appId: '1:1053052441768:web:b3e83cda7c2786fe0a1e9d',
    messagingSenderId: '1053052441768',
    projectId: 'expense-c0944',
    authDomain: 'expense-c0944.firebaseapp.com',
    storageBucket: 'expense-c0944.appspot.com',
    measurementId: 'G-RN4WZZ2F28',
  );
}
