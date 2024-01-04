// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

Future<AuthResponseStruct> registerWithEmail(
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

    usersCollection.add({
      'email': email,
      'uid': email,
      'created_time': DateTime.now()
    }).then((value) async {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    }).catchError((error) {
      print("Error: $error");
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
