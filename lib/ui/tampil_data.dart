// lib/ui/tampil_data.dart
import 'package:flutter/material.dart';

class TampilData extends StatelessWidget {
  // Variabel untuk menampung data yang dikirim
  final String nama;
  final String nim;
  final String tahunLahir;

  // Constructor untuk menerima data saat TampilData dipanggil
  const TampilData({
    super.key,
    required this.nama,
    required this.nim,
    required this.tahunLahir,
  });

  @override
  Widget build(BuildContext context) {
    // Hitung umur (sederhana)
    int umur = DateTime.now().year - int.parse(tahunLahir);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Input Data'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          // Card untuk membungkus data agar terlihat "menarik"
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Agar Card tidak full screen
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Icon(
                      Icons.check_circle_outline,
                      size: 80,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Center(
                    child: Text(
                      'Data Berhasil Disimpan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 16),
                  
                  // Menampilkan data menggunakan ListTile agar rapi
                  _buildDataRow(
                    icon: Icons.person,
                    label: 'Nama',
                    value: nama,
                  ),
                  _buildDataRow(
                    icon: Icons.badge,
                    label: 'NIM',
                    value: nim,
                  ),
                  _buildDataRow(
                    icon: Icons.cake,
                    label: 'Tahun Lahir',
                    value: tahunLahir,
                  ),
                  _buildDataRow(
                    icon: Icons.hourglass_top,
                    label: 'Perkiraan Umur',
                    value: '$umur tahun',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget helper untuk membuat baris data (Icon - Label - Value)
  Widget _buildDataRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue.shade700, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}