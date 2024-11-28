import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/gps_controller.dart';

class HomeView extends StatelessWidget {
  // Inisialisasi controller
  final GPSController gpsController = Get.put(GPSController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GPS Tracker'),
        backgroundColor: Colors.blueAccent, // Ganti warna appBar,
      ),
      body: Obx(() {
        // Menunggu proses loading
        if (gpsController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
            ),
          );
        }

        // Menampilkan hasil lokasi atau pesan error
        return Padding(
          padding: const EdgeInsets.all(16.0), // Memberikan padding di sekitar body
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Aku lagi dimana?',
                  style: TextStyle(
                    fontSize: 24, // Menambahkan ukuran font yang lebih besar
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple, // Ganti warna teks
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  gpsController.locationMessage.value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87, // Warna teks untuk detail
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent, // Warna tombol
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Tombol dengan sudut melengkung
                    ),
                  ),
                  onPressed: gpsController.getCurrentLocation, // Memanggil fungsi untuk mendapatkan lokasi
                  child: const Text(
                    'Cari Lokasiku',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen, // Ganti warna tombol untuk Google Maps
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Tombol dengan sudut melengkung
                    ),
                  ),
                  onPressed: gpsController.openGoogleMaps, // Memanggil fungsi untuk membuka Google Maps
                  child: const Text(
                    'Buka Google Maps',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
