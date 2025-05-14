import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class CheckInternet {
  static CheckInternet? _instance;

  CheckInternet._internal();

  factory CheckInternet() {
    return _instance??=CheckInternet._internal();
  }

  bool _hasConnection = false;
  final StreamController _connectionChangeController = StreamController.broadcast();
  final Connectivity _connectivity = Connectivity();

  Stream get connectionChange => _connectionChangeController.stream;

  void initialize() async{
    final List<ConnectivityResult> result = await (Connectivity().checkConnectivity());
    await _checkConnection(result);
    _connectionChangeController.add(_hasConnection);
    _connectivity.onConnectivityChanged.listen(_connectionChange);

  }

  _checkConnection(List<ConnectivityResult> result) async {
    if (result[0] == ConnectivityResult.mobile ||
        result[0] == ConnectivityResult.wifi) {
      final result = await InternetConnectionChecker.instance.hasConnection;
      if (result??false) {
        _hasConnection = true;
      } else {
        _hasConnection = false;
      }
    } else {
      _hasConnection = false;
    }
  }

  _connectionChange(List<ConnectivityResult> result) async {
    bool previousConnection = _hasConnection;
    await _checkConnection(result);
    if (previousConnection != _hasConnection) {
      _connectionChangeController.add(_hasConnection);
    }
    return _hasConnection;
  }

}