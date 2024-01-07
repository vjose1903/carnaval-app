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

Future<DocumentReference?> getTipoUsuarioByDescripcion(
    String descripcion) async {
  CollectionReference tipoUsuarioCollection =
      FirebaseFirestore.instance.collection('tipo_usuario');

  QuerySnapshot querySnapshot = await tipoUsuarioCollection
      .where('descripcion', isEqualTo: descripcion)
      .limit(1)
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    return querySnapshot.docs.first.reference;
  } else {
    print(
        "No se encontraron documentos en coleccionB con la descripción proporcionada.");
    return null;
  }
}
