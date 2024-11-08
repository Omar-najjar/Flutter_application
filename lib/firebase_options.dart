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
        return android;
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
    apiKey: 'AIzaSyCkg7854zbNNU9HwbHCkUT9zPAoizgeq8E',
    appId: '1:965635737653:web:a61c1d9121c9ba6e2ac97c',
    messagingSenderId: '965635737653',
    projectId: 'crud-89e39',
    authDomain: 'crud-89e39.firebaseapp.com',
    storageBucket: 'crud-89e39.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASf0PqOLIUTiBKGmMGDa7yA9nhZ5AVkvs',
    appId: '1:965635737653:android:7316b02c31ce03682ac97c',
    messagingSenderId: '965635737653',
    projectId: 'crud-89e39',
    storageBucket: 'crud-89e39.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA3kg4vqpL2axHgp-qtnaABfub1zsKWa7Q',
    appId: '1:965635737653:ios:bf6de20cd5fdcd452ac97c',
    messagingSenderId: '965635737653',
    projectId: 'crud-89e39',
    storageBucket: 'crud-89e39.appspot.com',
    iosBundleId: 'com.example.crudTuto',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA3kg4vqpL2axHgp-qtnaABfub1zsKWa7Q',
    appId: '1:965635737653:ios:bf6de20cd5fdcd452ac97c',
    messagingSenderId: '965635737653',
    projectId: 'crud-89e39',
    storageBucket: 'crud-89e39.appspot.com',
    iosBundleId: 'com.example.crudTuto',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCkg7854zbNNU9HwbHCkUT9zPAoizgeq8E',
    appId: '1:965635737653:web:1de68d02602ffdd82ac97c',
    messagingSenderId: '965635737653',
    projectId: 'crud-89e39',
    authDomain: 'crud-89e39.firebaseapp.com',
    storageBucket: 'crud-89e39.appspot.com',
  );
}
