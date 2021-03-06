// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD0fjlGfvtKLBqYUou2FwUs63CTBlNzNlw',
    appId: '1:860547245671:android:5acd8fecf7ecb83200d6c2',
    messagingSenderId: '860547245671',
    projectId: 'kagura1-91899',
    storageBucket: 'kagura1-91899.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC-SRPQ8H1Y_80urKyMX6GZqB2mv0na5ck',
    appId: '1:860547245671:ios:077dbef7fe53c61a00d6c2',
    messagingSenderId: '860547245671',
    projectId: 'kagura1-91899',
    storageBucket: 'kagura1-91899.appspot.com',
    iosClientId: '860547245671-jd5s0omljhglufa8gencp8s45rqkosof.apps.googleusercontent.com',
    iosBundleId: 'com.example.sliverAppbar',
  );
}
