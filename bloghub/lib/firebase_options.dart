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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyDnAdGKs4XOlZu7GlRtc7D8LeddXM9tfuU',
    appId: '1:791592586779:web:ef57920e8b36662bdb32be',
    messagingSenderId: '791592586779',
    projectId: 'bloghub-271d6',
    authDomain: 'bloghub-271d6.firebaseapp.com',
    storageBucket: 'bloghub-271d6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCeyJXPh3ZmcNeNxJR6oSkQwyVP9ikB2Hw',
    appId: '1:791592586779:android:efa715f51571d454db32be',
    messagingSenderId: '791592586779',
    projectId: 'bloghub-271d6',
    storageBucket: 'bloghub-271d6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-N4Cos8B1yzwbUXZLCUF3pF5NgSuuCdU',
    appId: '1:791592586779:ios:70b20b64ae154431db32be',
    messagingSenderId: '791592586779',
    projectId: 'bloghub-271d6',
    storageBucket: 'bloghub-271d6.appspot.com',
    iosClientId: '791592586779-6cbd2n19kdgg21sdngcr411uc33n684c.apps.googleusercontent.com',
    iosBundleId: 'com.example.bloghub',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB-N4Cos8B1yzwbUXZLCUF3pF5NgSuuCdU',
    appId: '1:791592586779:ios:70b20b64ae154431db32be',
    messagingSenderId: '791592586779',
    projectId: 'bloghub-271d6',
    storageBucket: 'bloghub-271d6.appspot.com',
    iosClientId: '791592586779-6cbd2n19kdgg21sdngcr411uc33n684c.apps.googleusercontent.com',
    iosBundleId: 'com.example.bloghub',
  );
}
