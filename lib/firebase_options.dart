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
    apiKey: 'AIzaSyB7uZIingg_QPUEjv3ghPKke40ygR0FH4Y',
    appId: '1:968714346137:web:491a00efe137ec26f1a208',
    messagingSenderId: '968714346137',
    projectId: 'lbp-app-5ba75',
    authDomain: 'lbp-app-5ba75.firebaseapp.com',
    storageBucket: 'lbp-app-5ba75.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBmfkyRSs1Fmx0z80EFdrrejdeEOujnIao',
    appId: '1:968714346137:android:98d4257a37ada58df1a208',
    messagingSenderId: '968714346137',
    projectId: 'lbp-app-5ba75',
    storageBucket: 'lbp-app-5ba75.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD2UoW83GIxIJpFotZGfaJ5-b9r9cp_3zc',
    appId: '1:968714346137:ios:cad9f4303371c862f1a208',
    messagingSenderId: '968714346137',
    projectId: 'lbp-app-5ba75',
    storageBucket: 'lbp-app-5ba75.appspot.com',
    iosBundleId: 'com.example.lbp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD2UoW83GIxIJpFotZGfaJ5-b9r9cp_3zc',
    appId: '1:968714346137:ios:cad9f4303371c862f1a208',
    messagingSenderId: '968714346137',
    projectId: 'lbp-app-5ba75',
    storageBucket: 'lbp-app-5ba75.appspot.com',
    iosBundleId: 'com.example.lbp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB7uZIingg_QPUEjv3ghPKke40ygR0FH4Y',
    appId: '1:968714346137:web:38ab875a717dfd78f1a208',
    messagingSenderId: '968714346137',
    projectId: 'lbp-app-5ba75',
    authDomain: 'lbp-app-5ba75.firebaseapp.com',
    storageBucket: 'lbp-app-5ba75.appspot.com',
  );
}
