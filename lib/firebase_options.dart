import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not configured for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'YOUR_API_KEY_HERE',
    appId: '1:369216147174:web:YOUR_APP_ID',
    messagingSenderId: '369216147174',
    projectId: 'govtapp-608ff',
    storageBucket: 'govtapp-608ff.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'YOUR_API_KEY_HERE',
    appId: '1:369216147174:android:YOUR_APP_ID',
    messagingSenderId: '369216147174',
    projectId: 'govtapp-608ff',
    storageBucket: 'govtapp-608ff.appspot.com',
  );
}