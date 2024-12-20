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
    apiKey: 'AIzaSyDM1vDLhm8jhNGeH3VHEx1AdZp3YW9FyPY',
    appId: '1:826241709934:web:d681cc443d0a2f6adb337f',
    messagingSenderId: '826241709934',
    projectId: 'modul3codelab',
    authDomain: 'modul3codelab.firebaseapp.com',
    storageBucket: 'modul3codelab.appspot.com',
    measurementId: 'G-1KL3K7QSH2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA7Rbs2oKzUSTsYY130KZeTT9cKcdoJft0',
    appId: '1:826241709934:android:58303b82494bb8a9db337f',
    messagingSenderId: '826241709934',
    projectId: 'modul3codelab',
    storageBucket: 'modul3codelab.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTJa6JbTews4kiB0sNLXGIegdifY_6zLY',
    appId: '1:826241709934:ios:f067f92d6ca4e65bdb337f',
    messagingSenderId: '826241709934',
    projectId: 'modul3codelab',
    storageBucket: 'modul3codelab.appspot.com',
    iosBundleId: 'com.example.firebaseconfig',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBTJa6JbTews4kiB0sNLXGIegdifY_6zLY',
    appId: '1:826241709934:ios:f067f92d6ca4e65bdb337f',
    messagingSenderId: '826241709934',
    projectId: 'modul3codelab',
    storageBucket: 'modul3codelab.appspot.com',
    iosBundleId: 'com.example.firebaseconfig',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDM1vDLhm8jhNGeH3VHEx1AdZp3YW9FyPY',
    appId: '1:826241709934:web:392660aed3777da7db337f',
    messagingSenderId: '826241709934',
    projectId: 'modul3codelab',
    authDomain: 'modul3codelab.firebaseapp.com',
    storageBucket: 'modul3codelab.appspot.com',
    measurementId: 'G-PSWRYNZLZF',
  );
}
