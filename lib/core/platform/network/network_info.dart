import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  // NetworkInfoImpl(this.connectionState);
  Future<bool> checkConnection() async {
    final connection = await Connectivity().checkConnectivity();
    if (connection == ConnectivityResult.none) {
      return false;
    }
    return true;
  }

  @override
  Future<bool> get isConnected async => checkConnection();
}
