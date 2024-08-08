import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

// Default [FirebaseOptions] for use with your Firebase apps.

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
    apiKey: 'AIzaSyBfAFx4xb3Vy847tWxzVCuZMuGMPajkw3A',
    appId: '1:734783962938:web:fc7100e2d2efaebd7a9a03',
    messagingSenderId: '734783962938',
    projectId: 'quoteapp-60708',
    authDomain: 'quoteapp-60708.firebaseapp.com',
    storageBucket: 'quoteapp-60708.appspot.com',
    measurementId: 'G-L5Y0YZE6HD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAljbJtcBwm8hTL5cYB6QhK-aiyf68yoe8',
    appId: '1:734783962938:android:99a1c5559171949a7a9a03',
    messagingSenderId: '734783962938',
    projectId: 'quoteapp-60708',
    storageBucket: 'quoteapp-60708.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA24SgQdQ87XxDzv_BS6yKV4TjgaTjugD0',
    appId: '1:734783962938:ios:d14cb9f20c78bdd17a9a03',
    messagingSenderId: '734783962938',
    projectId: 'quoteapp-60708',
    storageBucket: 'quoteapp-60708.appspot.com',
    iosBundleId: 'com.example.quoteApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA24SgQdQ87XxDzv_BS6yKV4TjgaTjugD0',
    appId: '1:734783962938:ios:d14cb9f20c78bdd17a9a03',
    messagingSenderId: '734783962938',
    projectId: 'quoteapp-60708',
    storageBucket: 'quoteapp-60708.appspot.com',
    iosBundleId: 'com.example.quoteApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBfAFx4xb3Vy847tWxzVCuZMuGMPajkw3A',
    appId: '1:734783962938:web:39c7473ad3f1d33c7a9a03',
    messagingSenderId: '734783962938',
    projectId: 'quoteapp-60708',
    authDomain: 'quoteapp-60708.firebaseapp.com',
    storageBucket: 'quoteapp-60708.appspot.com',
    measurementId: 'G-D8J16BE8ZJ',
  );
}
