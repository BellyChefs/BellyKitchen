import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HandleMissingNetworkNotifier with ChangeNotifier {
  bool _isNetworkEnabled = true;

  bool get isNetworkEnabled => _isNetworkEnabled;

  HandleMissingNetworkNotifier() {
    Connectivity _connectivity = new Connectivity();
    _connectivity.onConnectivityChanged.listen((event) async {
      if (event == ConnectivityResult.none) {
        _isNetworkEnabled = false;
        notifyListeners();
      } else {
        _isNetworkEnabled = true;
        notifyListeners();
      }
    });
  }
}

final handleMissingNetworkProvider =
    ChangeNotifierProvider<HandleMissingNetworkNotifier>((ref) {
  return HandleMissingNetworkNotifier();
});
