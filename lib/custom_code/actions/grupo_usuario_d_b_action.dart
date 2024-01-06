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

Future<bool> grupoUsuarioDBAction(
  DocumentReference usuarioReference,
  DocumentReference grupoReference,
  String type,
) async {
  // Add your function code here!
  CollectionReference grupoUsuarioCollection =
      FirebaseFirestore.instance.collection('grupo_usuario');

  grupoUsuarioCollection
      .where("usuario", isEqualTo: usuarioReference)
      .where("grupo", isEqualTo: grupoReference)
      .limit(1)
      .get()
      .then((QuerySnapshot querySnapshot) {
    if (querySnapshot.docs.isNotEmpty) {
      // Si la lista de documentos no está vacía, significa que se encontró al menos un documento
      print("El documento existe en la base de datos");
      var primerDocumento = querySnapshot.docs.first;
      print("Document data: ${primerDocumento.data()}");

      if (type == 'remove') {
        print("procediendo a removerlo");
      } else {
        print("no hacer nada");
      }
    } else {
      // La lista de documentos está vacía, el documento no existe
      print("El documento no existe en la base de datos");

      if (type == 'add') {
        print("procediendo a agregarlo");
      } else {
        print("no hacer nada");
      }
    }
  });

  // current_grupo_usuario = grupoUsuarioCollection
  // credential.user?.delete();
  return true;
}
