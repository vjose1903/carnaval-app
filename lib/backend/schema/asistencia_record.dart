import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class AsistenciaRecord extends FirestoreRecord {
  AsistenciaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "grupo_usuario" field.
  DocumentReference? _grupoUsuario;
  DocumentReference? get grupoUsuario => _grupoUsuario;
  bool hasGrupoUsuario() => _grupoUsuario != null;

  // "grupo_actividad_detalle" field.
  DocumentReference? _grupoActividadDetalle;
  DocumentReference? get grupoActividadDetalle => _grupoActividadDetalle;
  bool hasGrupoActividadDetalle() => _grupoActividadDetalle != null;

  // "presente" field.
  bool? _presente;
  bool get presente => _presente ?? false;
  bool hasPresente() => _presente != null;

  // "comentario" field.
  List<String>? _comentario;
  List<String> get comentario => _comentario ?? const [];
  bool hasComentario() => _comentario != null;

  void _initializeFields() {
    _grupoUsuario = snapshotData['grupo_usuario'] as DocumentReference?;
    _grupoActividadDetalle =
        snapshotData['grupo_actividad_detalle'] as DocumentReference?;
    _presente = snapshotData['presente'] as bool?;
    _comentario = getDataList(snapshotData['comentario']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('asistencia');

  static Stream<AsistenciaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AsistenciaRecord.fromSnapshot(s));

  static Future<AsistenciaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AsistenciaRecord.fromSnapshot(s));

  static AsistenciaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AsistenciaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AsistenciaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AsistenciaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AsistenciaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AsistenciaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAsistenciaRecordData({
  DocumentReference? grupoUsuario,
  DocumentReference? grupoActividadDetalle,
  bool? presente,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'grupo_usuario': grupoUsuario,
      'grupo_actividad_detalle': grupoActividadDetalle,
      'presente': presente,
    }.withoutNulls,
  );

  return firestoreData;
}

class AsistenciaRecordDocumentEquality implements Equality<AsistenciaRecord> {
  const AsistenciaRecordDocumentEquality();

  @override
  bool equals(AsistenciaRecord? e1, AsistenciaRecord? e2) {
    const listEquality = ListEquality();
    return e1?.grupoUsuario == e2?.grupoUsuario &&
        e1?.grupoActividadDetalle == e2?.grupoActividadDetalle &&
        e1?.presente == e2?.presente &&
        listEquality.equals(e1?.comentario, e2?.comentario);
  }

  @override
  int hash(AsistenciaRecord? e) => const ListEquality().hash(
      [e?.grupoUsuario, e?.grupoActividadDetalle, e?.presente, e?.comentario]);

  @override
  bool isValidKey(Object? o) => o is AsistenciaRecord;
}
