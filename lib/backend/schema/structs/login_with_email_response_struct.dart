// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LoginWithEmailResponseStruct extends FFFirebaseStruct {
  LoginWithEmailResponseStruct({
    String? message,
    bool? error,
    DocumentReference? usuario,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _message = message,
        _error = error,
        _usuario = usuario,
        super(firestoreUtilData);

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;
  bool hasMessage() => _message != null;

  // "error" field.
  bool? _error;
  bool get error => _error ?? false;
  set error(bool? val) => _error = val;
  bool hasError() => _error != null;

  // "usuario" field.
  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  set usuario(DocumentReference? val) => _usuario = val;
  bool hasUsuario() => _usuario != null;

  static LoginWithEmailResponseStruct fromMap(Map<String, dynamic> data) =>
      LoginWithEmailResponseStruct(
        message: data['message'] as String?,
        error: data['error'] as bool?,
        usuario: data['usuario'] as DocumentReference?,
      );

  static LoginWithEmailResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? LoginWithEmailResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'message': _message,
        'error': _error,
        'usuario': _usuario,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'error': serializeParam(
          _error,
          ParamType.bool,
        ),
        'usuario': serializeParam(
          _usuario,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static LoginWithEmailResponseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LoginWithEmailResponseStruct(
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        error: deserializeParam(
          data['error'],
          ParamType.bool,
          false,
        ),
        usuario: deserializeParam(
          data['usuario'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Usuarios'],
        ),
      );

  @override
  String toString() => 'LoginWithEmailResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LoginWithEmailResponseStruct &&
        message == other.message &&
        error == other.error &&
        usuario == other.usuario;
  }

  @override
  int get hashCode => const ListEquality().hash([message, error, usuario]);
}

LoginWithEmailResponseStruct createLoginWithEmailResponseStruct({
  String? message,
  bool? error,
  DocumentReference? usuario,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LoginWithEmailResponseStruct(
      message: message,
      error: error,
      usuario: usuario,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LoginWithEmailResponseStruct? updateLoginWithEmailResponseStruct(
  LoginWithEmailResponseStruct? loginWithEmailResponse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    loginWithEmailResponse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLoginWithEmailResponseStructData(
  Map<String, dynamic> firestoreData,
  LoginWithEmailResponseStruct? loginWithEmailResponse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (loginWithEmailResponse == null) {
    return;
  }
  if (loginWithEmailResponse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      loginWithEmailResponse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final loginWithEmailResponseData = getLoginWithEmailResponseFirestoreData(
      loginWithEmailResponse, forFieldValue);
  final nestedData =
      loginWithEmailResponseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      loginWithEmailResponse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLoginWithEmailResponseFirestoreData(
  LoginWithEmailResponseStruct? loginWithEmailResponse, [
  bool forFieldValue = false,
]) {
  if (loginWithEmailResponse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(loginWithEmailResponse.toMap());

  // Add any Firestore field values
  loginWithEmailResponse.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLoginWithEmailResponseListFirestoreData(
  List<LoginWithEmailResponseStruct>? loginWithEmailResponses,
) =>
    loginWithEmailResponses
        ?.map((e) => getLoginWithEmailResponseFirestoreData(e, true))
        .toList() ??
    [];
