import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class GrupoActividadRecord extends FirestoreRecord {
  GrupoActividadRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "grupo" field.
  DocumentReference? _grupo;
  DocumentReference? get grupo => _grupo;
  bool hasGrupo() => _grupo != null;

  // "actividad" field.
  DocumentReference? _actividad;
  DocumentReference? get actividad => _actividad;
  bool hasActividad() => _actividad != null;

  void _initializeFields() {
    _grupo = snapshotData['grupo'] as DocumentReference?;
    _actividad = snapshotData['actividad'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('grupo_actividad');

  static Stream<GrupoActividadRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GrupoActividadRecord.fromSnapshot(s));

  static Future<GrupoActividadRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GrupoActividadRecord.fromSnapshot(s));

  static GrupoActividadRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GrupoActividadRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GrupoActividadRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GrupoActividadRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GrupoActividadRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GrupoActividadRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGrupoActividadRecordData({
  DocumentReference? grupo,
  DocumentReference? actividad,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'grupo': grupo,
      'actividad': actividad,
    }.withoutNulls,
  );

  return firestoreData;
}

class GrupoActividadRecordDocumentEquality
    implements Equality<GrupoActividadRecord> {
  const GrupoActividadRecordDocumentEquality();

  @override
  bool equals(GrupoActividadRecord? e1, GrupoActividadRecord? e2) {
    return e1?.grupo == e2?.grupo && e1?.actividad == e2?.actividad;
  }

  @override
  int hash(GrupoActividadRecord? e) =>
      const ListEquality().hash([e?.grupo, e?.actividad]);

  @override
  bool isValidKey(Object? o) => o is GrupoActividadRecord;
}
