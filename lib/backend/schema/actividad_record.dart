import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActividadRecord extends FirestoreRecord {
  ActividadRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "descripcion" field.
  int? _descripcion;
  int get descripcion => _descripcion ?? 0;
  bool hasDescripcion() => _descripcion != null;

  // "comentario" field.
  String? _comentario;
  String get comentario => _comentario ?? '';
  bool hasComentario() => _comentario != null;

  // "fecha_inicio" field.
  DateTime? _fechaInicio;
  DateTime? get fechaInicio => _fechaInicio;
  bool hasFechaInicio() => _fechaInicio != null;

  // "fecha_fin" field.
  DateTime? _fechaFin;
  DateTime? get fechaFin => _fechaFin;
  bool hasFechaFin() => _fechaFin != null;

  // "costo" field.
  double? _costo;
  double get costo => _costo ?? 0.0;
  bool hasCosto() => _costo != null;

  // "estado" field.
  bool? _estado;
  bool get estado => _estado ?? false;
  bool hasEstado() => _estado != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _descripcion = castToType<int>(snapshotData['descripcion']);
    _comentario = snapshotData['comentario'] as String?;
    _fechaInicio = snapshotData['fecha_inicio'] as DateTime?;
    _fechaFin = snapshotData['fecha_fin'] as DateTime?;
    _costo = castToType<double>(snapshotData['costo']);
    _estado = snapshotData['estado'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('actividad');

  static Stream<ActividadRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActividadRecord.fromSnapshot(s));

  static Future<ActividadRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActividadRecord.fromSnapshot(s));

  static ActividadRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActividadRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActividadRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActividadRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActividadRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActividadRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActividadRecordData({
  String? nombre,
  int? descripcion,
  String? comentario,
  DateTime? fechaInicio,
  DateTime? fechaFin,
  double? costo,
  bool? estado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'descripcion': descripcion,
      'comentario': comentario,
      'fecha_inicio': fechaInicio,
      'fecha_fin': fechaFin,
      'costo': costo,
      'estado': estado,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActividadRecordDocumentEquality implements Equality<ActividadRecord> {
  const ActividadRecordDocumentEquality();

  @override
  bool equals(ActividadRecord? e1, ActividadRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.descripcion == e2?.descripcion &&
        e1?.comentario == e2?.comentario &&
        e1?.fechaInicio == e2?.fechaInicio &&
        e1?.fechaFin == e2?.fechaFin &&
        e1?.costo == e2?.costo &&
        e1?.estado == e2?.estado;
  }

  @override
  int hash(ActividadRecord? e) => const ListEquality().hash([
        e?.nombre,
        e?.descripcion,
        e?.comentario,
        e?.fechaInicio,
        e?.fechaFin,
        e?.costo,
        e?.estado
      ]);

  @override
  bool isValidKey(Object? o) => o is ActividadRecord;
}
