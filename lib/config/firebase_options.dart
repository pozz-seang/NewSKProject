// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

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
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB7f-uyKlwGcwM4KkK0OgR-Cb72h1PynHk',
    appId: '1:452891495600:android:d84adec4807821c834bf75',
    messagingSenderId: '452891495600',
    projectId: 'flutter-9d221',
    storageBucket: 'flutter-9d221.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBRupZA6SZqOuhoxVRDhddmC84H7d6YfRA',
    appId: '1:452891495600:ios:02f57ad0e105bec034bf75',
    messagingSenderId: '452891495600',
    projectId: 'flutter-9d221',
    storageBucket: 'flutter-9d221.appspot.com',
    iosClientId:
        '452891495600-bbahs8q3hsiqvpa5d9dhnlkpc3g92u6p.apps.googleusercontent.com',
    iosBundleId: 'com.example.newskproject',
  );
}

class Model {
  String name, value, key;
  bool p;
  Model({required this.name, required this.value, required this.key, required this.p});
}
