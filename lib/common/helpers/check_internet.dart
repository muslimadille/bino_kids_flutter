import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';

class InternetService with WidgetsBindingObserver {
  static final InternetService _instance = InternetService._internal();

  factory InternetService() => _instance;

  InternetService._internal();

  final StreamController<bool> _controller =
  StreamController<bool>.broadcast();

  Stream<bool> get onStatusChange => _controller.stream;

  bool _hasConnection = true;
  bool _isPaused = false;

  Timer? _timer;

  bool get hasConnection => _hasConnection;

  void start({Duration interval = const Duration(seconds: 5)}) {
    _timer?.cancel();
    _isPaused = false;

    WidgetsBinding.instance.addObserver(this);

    _checkConnection(); // initial check

    _timer = Timer.periodic(interval, (_) {
      if (!_isPaused) {
        _checkConnection();
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      _isPaused = true;
    } else if (state == AppLifecycleState.resumed) {
      _isPaused = false;
      // Re-check connection on resume with a small delay
      Future.delayed(const Duration(milliseconds: 500), () {
        _checkConnection();
      });
    }
  }

  void stop() {
    _timer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
  }

  Future<bool> checkNow() async {
    await _checkConnection();
    return _hasConnection;
  }

  Future<void> _checkConnection() async {
    if (_isPaused) return;

    final previous = _hasConnection;

    _hasConnection = await _hasInternetSocket();

    // Only emit when status actually changes
    if (previous != _hasConnection) {
      _controller.add(_hasConnection);
    }
  }

  Future<bool> _hasInternetSocket() async {
    try {
      final socket = await Socket.connect(
        'google.com',
        443,
        timeout: const Duration(seconds: 5),
      );

      socket.destroy();

      return true;
    } catch (_) {
      return false;
    }
  }

  void dispose() {
    _timer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    _controller.close();
  }
}
