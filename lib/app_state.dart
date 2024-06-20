import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
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
    _safeInit(() {
      _marketOn = prefs.getBool('ff_marketOn') ?? _marketOn;
    });
    _safeInit(() {
      _biometricLogin = prefs.getBool('ff_biometricLogin') ?? _biometricLogin;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _accessToken = '';
  String get accessToken => _accessToken;
  set accessToken(String value) {
    _accessToken = value;
    prefs.setString('ff_accessToken', value);
  }

  String _refreshToken = '';
  String get refreshToken => _refreshToken;
  set refreshToken(String value) {
    _refreshToken = value;
    prefs.setString('ff_refreshToken', value);
  }

  UserStruct _user = UserStruct();
  UserStruct get user => _user;
  set user(UserStruct value) {
    _user = value;
    prefs.setString('ff_user', value.serialize());
  }

  void updateUserStruct(Function(UserStruct) updateFn) {
    updateFn(_user);
    prefs.setString('ff_user', _user.serialize());
  }

  int _expires = 0;
  int get expires => _expires;
  set expires(int value) {
    _expires = value;
    prefs.setInt('ff_expires', value);
  }

  String _staffid = '';
  String get staffid => _staffid;
  set staffid(String value) {
    _staffid = value;
  }

  List<String> _listaResultado = [];
  List<String> get listaResultado => _listaResultado;
  set listaResultado(List<String> value) {
    _listaResultado = value;
  }

  void addToListaResultado(String value) {
    listaResultado.add(value);
  }

  void removeFromListaResultado(String value) {
    listaResultado.remove(value);
  }

  void removeAtIndexFromListaResultado(int index) {
    listaResultado.removeAt(index);
  }

  void updateListaResultadoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listaResultado[index] = updateFn(_listaResultado[index]);
  }

  void insertAtIndexInListaResultado(int index, String value) {
    listaResultado.insert(index, value);
  }

  dynamic _staffLogin;
  dynamic get staffLogin => _staffLogin;
  set staffLogin(dynamic value) {
    _staffLogin = value;
  }

  dynamic _staffDepartment;
  dynamic get staffDepartment => _staffDepartment;
  set staffDepartment(dynamic value) {
    _staffDepartment = value;
  }

  dynamic _staffBranch;
  dynamic get staffBranch => _staffBranch;
  set staffBranch(dynamic value) {
    _staffBranch = value;
  }

  dynamic _staffOrganization;
  dynamic get staffOrganization => _staffOrganization;
  set staffOrganization(dynamic value) {
    _staffOrganization = value;
  }

  int _dataTimeStartToken = 0;
  int get dataTimeStartToken => _dataTimeStartToken;
  set dataTimeStartToken(int value) {
    _dataTimeStartToken = value;
    prefs.setInt('ff_dataTimeStartToken', value);
  }

  String _alertCheck = '';
  String get alertCheck => _alertCheck;
  set alertCheck(String value) {
    _alertCheck = value;
  }

  String _idCheck = '';
  String get idCheck => _idCheck;
  set idCheck(String value) {
    _idCheck = value;
  }

  bool _marketOn = true;
  bool get marketOn => _marketOn;
  set marketOn(bool value) {
    _marketOn = value;
    prefs.setBool('ff_marketOn', value);
  }

  dynamic _Author;
  dynamic get Author => _Author;
  set Author(dynamic value) {
    _Author = value;
  }

  bool _biometricLogin = false;
  bool get biometricLogin => _biometricLogin;
  set biometricLogin(bool value) {
    _biometricLogin = value;
    prefs.setBool('ff_biometricLogin', value);
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
