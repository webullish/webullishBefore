import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    /// if you want configuration for web from here
    /// and fill your data from web's google-services.json file ///
    // if (kIsWeb) {
    //   // Web
    //   return const FirebaseOptions(
    //     apiKey: 'AIzaSyBiLX-okW4yyN5x05WqzltrRkkW7PvnDxk',
    //     authDomain: 'webullish-14c86.firebaseapp.com',
    //     databaseURL:'',
    //     projectId: 'webullish-14c86',
    //     storageBucket: 'webullish-14c86.appspot.com',
    //     messagingSenderId: '708892247921',
    //     appId: '1:708892247921:web:11215fefd7dd53672898d0',
    //     measurementId: 'G-KQD9Q31B22',
    //   );

    /// also if you wont configuration for IOS from here
    /// and fill your data from IOS's google-services.json file ///
    // } else if (Platform.isIOS || Platform.isMacOS) {
    //   // iOS and MacOS
    //   return const FirebaseOptions(
    //     apiKey: 'AIzaSyDJsSQ8rVnfen7kB5nPWrsEfP0fPdU8yUI',
    //     authDomain: 'webullish-14c86.firebaseapp.com',
    //     databaseURL:'',
    //     projectId: 'webullish-14c86',
    //     storageBucket: 'webullish-14c86.appspot.com',
    //     messagingSenderId: '708892247921',
    //     appId: '1:708892247921:ios:a791500d6aebd6682898d0',
    //     measurementId: '',
    //   );
    // } else {
    //   // Android

    /// To do change your data from google-services.json file ///
    /// in this configuration we work for android only  ///
    return const FirebaseOptions(
      appId: '1:708892247921:android:e9e2b999a7e537f82898d0',
      apiKey: 'AIzaSyDbBh0q-IBQg0EryLYonwsP24iH4G6qh9U',
      projectId: 'webullish-14c86',
      androidClientId:
          '708892247921-pg9asrrkld5dsoh9ers5ppvtii9q68od.apps.googleusercontent.com',
      // we can find it from firebase/project setting /  Cloud Messaging
      messagingSenderId: '708892247921',
      // we can find it from firebase/ Authentication /Sign-in method
      authDomain: 'webullish-14c86.firebaseapp.com',
    );
    // }
  }
}
