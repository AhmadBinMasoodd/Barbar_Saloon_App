import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkController extends GetxController {
  // Observable for connection status
  var isConnected = false.obs;

  final Connectivity _connectivity = Connectivity();
  late final Stream<List<ConnectivityResult>> _connectivityStream;

  @override
  void onInit() {
    super.onInit();
    // Listen to connectivity changes
    _connectivityStream = _connectivity.onConnectivityChanged;
    _connectivityStream.listen((results) async {
      // Check actual internet access
      bool hasInternet = await InternetConnectionChecker.createInstance().hasConnection;
      isConnected.value = hasInternet;
    });

    // Initial check
    checkConnection();
  }

  // Manually check connection
  Future<void> checkConnection() async {
    List<ConnectivityResult> results = await _connectivity.checkConnectivity();
    if (results.contains(ConnectivityResult.none)) {
      isConnected.value = false;
    } else {
      isConnected.value = await InternetConnectionChecker.createInstance().hasConnection;
    }
  }
}
