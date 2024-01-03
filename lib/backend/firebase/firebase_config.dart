import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAlWk7EQyBuScm8vo3ob9YyAJeuS9_FNxU",
            authDomain: "carnaval-d2054.firebaseapp.com",
            projectId: "carnaval-d2054",
            storageBucket: "carnaval-d2054.appspot.com",
            messagingSenderId: "186859224506",
            appId: "1:186859224506:web:bb43c67bc9cc292c4bf183",
            measurementId: "G-5X3FLR9ZT4"));
  } else {
    await Firebase.initializeApp();
  }
}
