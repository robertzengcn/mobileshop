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
    apiKey: 'AIzaSyAs7qJGs3VeyMuWkeOzbViQfDF-M-lXSEs',
    appId: '1:884455045668:android:c029af1e214509fe3b36b1',
    messagingSenderId: '884455045668',
    projectId: 'amigatoydata',
    databaseURL: 'https://amigatoydata.firebaseio.com',
    storageBucket: 'amigatoydata.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCaLqdYqhyH1iiXYUOhFC-ULpkoKa1c4s4',
    appId: '1:884455045668:ios:e2b4e5a30302bcc63b36b1',
    messagingSenderId: '884455045668',
    projectId: 'amigatoydata',
    databaseURL: 'https://amigatoydata.firebaseio.com',
    storageBucket: 'amigatoydata.appspot.com',
    iosClientId: '884455045668-dvp9krj6uhqt33er6atlhkhk5a2q660q.apps.googleusercontent.com',
    iosBundleId: 'com.amigatoy.appdata',
  );
}
