// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<AuthResponseStruct> registerWithEmail(
  BuildContext context,
  String email,
  String password,
  String confirmPassword,
) async {
  if (password != confirmPassword)
    return RegisterResult("Las contraseñas no coinciden", true);

  try {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('Usuarios');

    final userData = <String, dynamic>{
      'email': email,
      'uid': credential.user?.uid,
      'created_time': DateTime.now()
    };

    usersCollection.doc(credential.user?.uid).set(userData).then((value) async {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    }).onError((e, _) {
      print("Error: $e");
      credential.user?.delete();
    });

    return RegisterResult("Registro Completo", false);
  } on FirebaseAuthException catch (e) {
    String messaje = '';

    if (e.code == 'weak-password')
      messaje = 'La contraseña utilizada es muy débil.';
    else if (e.code == 'email-already-in-use')
      messaje = 'Ya existe una cuenta con el email proporcionado.';
    else if (e.code == 'invalid-email')
      messaje = 'El email proporcionado es invalido.';
    else
      messaje = 'Error Desconocido.';

    return RegisterResult(messaje, true);
  } catch (e) {
    return RegisterResult(e.toString(), true);
  }
}

AuthResponseStruct RegisterResult(String message, bool error) {
  AuthResponseStruct resultado = AuthResponseStruct();

  resultado.message = message;
  resultado.error = error;

  return resultado;
}
