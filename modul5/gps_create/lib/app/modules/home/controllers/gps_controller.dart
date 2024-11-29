import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart'; // Untuk membuka URL di browser
import 'package:geocoding/geocoding.dart'; // Tambahkan untuk geocoding

class GPSController extends GetxController {
  var currentPosition = Rx<Position?>(null);
  var locationMessage = ".......".obs;
  var isLoading = false.obs;

  //lokasi saat ini
  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    //loading state
    isLoading.value = true;

    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        locationMessage.value = 'Layanan lokasi tidak aktif.';
        isLoading.value = false;
        return;
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          locationMessage.value = 'Izin lokasi ditolak.';
          isLoading.value = false;
          return;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        locationMessage.value = 'Izin lokasi ditolak secara permanen.';
        isLoading.value = false;
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );

      //posisi dan pesan lokasi
      currentPosition.value = position;

      // Cek apakah GeocodingPlatform.instance tidak null
      if (GeocodingPlatform.instance != null) {
        // Mendapatkan alamat lengkap dari geocoding
        List<Placemark> placemarks = await GeocodingPlatform.instance!.placemarkFromCoordinates(
            position.latitude, position.longitude);

        // Cek apakah ada alamat yang ditemukan
        if (placemarks.isNotEmpty) {
          Placemark place = placemarks[0];

          // Menambahkan informasi lengkap dengan koma sebagai pemisah
          locationMessage.value = '''
Hai, kamu lagi di ${place.subLocality ?? "Desa"}, 
${place.locality ?? "Kecamatan"}, 
${place.subAdministrativeArea ?? "Kabupaten"},
${place.administrativeArea ?? "Provinsi"}, 
${place.country ?? "Negara"}.

Titik Koordinat: 
Latitude: ${position.latitude}
Longitude: ${position.longitude}
''';
        } else {
          locationMessage.value = 'Alamat tidak ditemukan';
        }
      } else {
        locationMessage.value = 'Geocoding platform tidak tersedia';
      }
    } catch (e) {
      locationMessage.value = 'Gagal mendapatkan lokasi: $e';
    } finally {
      isLoading.value = false;
    }
  }

  void openGoogleMaps() {
    if (currentPosition.value != null) {
      final latitude = currentPosition.value!.latitude;
      final longitude = currentPosition.value!.longitude;

      final url = 'https://www.google.com/maps?q=$latitude,$longitude';
      _launchURL(url);
    }
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      locationMessage.value = "Tidak bisa membuka URL: $url";
    }
  }
}
