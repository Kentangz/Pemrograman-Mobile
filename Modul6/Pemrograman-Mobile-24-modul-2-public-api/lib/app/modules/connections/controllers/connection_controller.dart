import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart'; // Import Routes

class ConnectionController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  // Rx untuk menyimpan status koneksi
  final Rx<ConnectivityResult> _connectivityResult = ConnectivityResult.none.obs;

  // Getter untuk akses status koneksi
  ConnectivityResult get connectivityResult => _connectivityResult.value;

  @override
  void onInit() {
    super.onInit();
    // Menangani perubahan status koneksi
    _connectivity.onConnectivityChanged.listen((connectivityResults) {
      if (connectivityResults.isNotEmpty) {
        // Mengambil elemen pertama dari List<ConnectivityResult>
        _connectivityResult.value = connectivityResults.first;
        _updateConnectionStatus(connectivityResults.first); // Periksa koneksi dan lakukan navigasi
      }
    });
  }

  // Fungsi untuk mengupdate status koneksi dan navigasi sesuai statusnya
  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      // Navigasi ke NoConnectionView jika tidak ada koneksi
      if (Get.currentRoute != Routes.NO_CONNECTION) {
        Get.offAllNamed(Routes.NO_CONNECTION);
      }
    } else {
      // Navigasi sesuai dengan jenis koneksi
      if (Get.currentRoute == Routes.NO_CONNECTION) {
        if (connectivityResult == ConnectivityResult.wifi) {
          Get.offAllNamed(Routes.HTTP);
        } else if (connectivityResult == ConnectivityResult.mobile) {
          Get.offAllNamed(Routes.GETCONNECT);
        } else {
          Get.offAllNamed(Routes.DIO);
        }
      }
    }
  }
}
