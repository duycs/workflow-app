import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

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
      _accessToken = prefs.getString('ff_accessToken') ?? _accessToken;
    });
    _safeInit(() {
      _refreshToken = prefs.getString('ff_refreshToken') ?? _refreshToken;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_user')) {
        try {
          final serializedData = prefs.getString('ff_user') ?? '{}';
          _user = UserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _expires = prefs.getInt('ff_expires') ?? _expires;
    });
    _safeInit(() {
      _dataTimeStartToken =
          prefs.getInt('ff_dataTimeStartToken') ?? _dataTimeStartToken;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _accessToken = '';
  String get accessToken => _accessToken;
  set accessToken(String _value) {
    _accessToken = _value;
    prefs.setString('ff_accessToken', _value);
  }

  String _refreshToken = '';
  String get refreshToken => _refreshToken;
  set refreshToken(String _value) {
    _refreshToken = _value;
    prefs.setString('ff_refreshToken', _value);
  }

  UserStruct _user = UserStruct();
  UserStruct get user => _user;
  set user(UserStruct _value) {
    _user = _value;
    prefs.setString('ff_user', _value.serialize());
  }

  void updateUserStruct(Function(UserStruct) updateFn) {
    updateFn(_user);
    prefs.setString('ff_user', _user.serialize());
  }

  int _expires = 0;
  int get expires => _expires;
  set expires(int _value) {
    _expires = _value;
    prefs.setInt('ff_expires', _value);
  }

  String _staffid = '';
  String get staffid => _staffid;
  set staffid(String _value) {
    _staffid = _value;
  }

  List<String> _listaResultado = [];
  List<String> get listaResultado => _listaResultado;
  set listaResultado(List<String> _value) {
    _listaResultado = _value;
  }

  void addToListaResultado(String _value) {
    _listaResultado.add(_value);
  }

  void removeFromListaResultado(String _value) {
    _listaResultado.remove(_value);
  }

  void removeAtIndexFromListaResultado(int _index) {
    _listaResultado.removeAt(_index);
  }

  void updateListaResultadoAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _listaResultado[_index] = updateFn(_listaResultado[_index]);
  }

  void insertAtIndexInListaResultado(int _index, String _value) {
    _listaResultado.insert(_index, _value);
  }

  dynamic _staffLogin;
  dynamic get staffLogin => _staffLogin;
  set staffLogin(dynamic _value) {
    _staffLogin = _value;
  }

  dynamic _staffDepartment;
  dynamic get staffDepartment => _staffDepartment;
  set staffDepartment(dynamic _value) {
    _staffDepartment = _value;
  }

  dynamic _staffBranch;
  dynamic get staffBranch => _staffBranch;
  set staffBranch(dynamic _value) {
    _staffBranch = _value;
  }

  dynamic _staffOrganization;
  dynamic get staffOrganization => _staffOrganization;
  set staffOrganization(dynamic _value) {
    _staffOrganization = _value;
  }

  int _dataTimeStartToken = 0;
  int get dataTimeStartToken => _dataTimeStartToken;
  set dataTimeStartToken(int _value) {
    _dataTimeStartToken = _value;
    prefs.setInt('ff_dataTimeStartToken', _value);
  }

  String _alertCheck = '';
  String get alertCheck => _alertCheck;
  set alertCheck(String _value) {
    _alertCheck = _value;
  }

  String _idCheck = '';
  String get idCheck => _idCheck;
  set idCheck(String _value) {
    _idCheck = _value;
  }
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
