import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _grupoSeleccionado =
          prefs.getString('ff_grupoSeleccionado')?.ref ?? _grupoSeleccionado;
    });
    _safeInit(() {
      _gruposSeguidos = prefs
              .getStringList('ff_gruposSeguidos')
              ?.map((path) => path.ref)
              .toList() ??
          _gruposSeguidos;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DocumentReference? _grupoSeleccionado;
  DocumentReference? get grupoSeleccionado => _grupoSeleccionado;
  set grupoSeleccionado(DocumentReference? value) {
    _grupoSeleccionado = value;
    value != null
        ? prefs.setString('ff_grupoSeleccionado', value.path)
        : prefs.remove('ff_grupoSeleccionado');
  }

  List<DocumentReference> _gruposSeguidos = [];
  List<DocumentReference> get gruposSeguidos => _gruposSeguidos;
  set gruposSeguidos(List<DocumentReference> value) {
    _gruposSeguidos = value;
    prefs.setStringList(
        'ff_gruposSeguidos', value.map((x) => x.path).toList());
  }

  void addToGruposSeguidos(DocumentReference value) {
    _gruposSeguidos.add(value);
    prefs.setStringList(
        'ff_gruposSeguidos', _gruposSeguidos.map((x) => x.path).toList());
  }

  void removeFromGruposSeguidos(DocumentReference value) {
    _gruposSeguidos.remove(value);
    prefs.setStringList(
        'ff_gruposSeguidos', _gruposSeguidos.map((x) => x.path).toList());
  }

  void removeAtIndexFromGruposSeguidos(int index) {
    _gruposSeguidos.removeAt(index);
    prefs.setStringList(
        'ff_gruposSeguidos', _gruposSeguidos.map((x) => x.path).toList());
  }

  void updateGruposSeguidosAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _gruposSeguidos[index] = updateFn(_gruposSeguidos[index]);
    prefs.setStringList(
        'ff_gruposSeguidos', _gruposSeguidos.map((x) => x.path).toList());
  }

  void insertAtIndexInGruposSeguidos(int index, DocumentReference value) {
    _gruposSeguidos.insert(index, value);
    prefs.setStringList(
        'ff_gruposSeguidos', _gruposSeguidos.map((x) => x.path).toList());
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
