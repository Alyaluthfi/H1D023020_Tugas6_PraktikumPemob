// lib/ui/form_data.dart
import 'package:flutter/material.dart';
import 'tampil_data.dart'; // Impor file tampil_data

class FormData extends StatefulWidget {
  const FormData({super.key});

  @override
  State<FormData> createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {
  // GlobalKey untuk validasi form
  final _formKey = GlobalKey<FormState>();

  // Controller untuk setiap TextFormField
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunLahirController = TextEditingController();

  // Fungsi untuk berpindah halaman dan mengirim data
  void _kirimData() {
    // Cek apakah form sudah valid
    if (_formKey.currentState!.validate()) {
      // Ambil data dari controller
      String nama = _namaController.text;
      String nim = _nimController.text;
      String tahunLahir = _tahunLahirController.text;

      // Berpindah halaman ke TampilData sambil mengirim data
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TampilData(
            nama: nama,
            nim: nim,
            tahunLahir: tahunLahir,
          ),
        ),
      );
    }
  }

  // Jangan lupa dispose controller saat widget tidak digunakan
  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _tahunLahirController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Input Data'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // Padding untuk memberi jarak dari tepi layar
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey, // Pasang GlobalKey ke Form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Icon(
                    Icons.assignment_ind,
                    size: 80,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 24),
                // TextFormField untuk Nama
                TextFormField(
                  controller: _namaController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Lengkap',
                    prefixIcon: Icon(Icons.person_outline),
                    hintText: 'Masukkan nama lengkap Anda',
                  ),
                  // Validasi
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // TextFormField untuk NIM
                TextFormField(
                  controller: _nimController,
                  decoration: const InputDecoration(
                    labelText: 'NIM',
                    prefixIcon: Icon(Icons.badge_outlined),
                    hintText: 'Masukkan NIM Anda',
                  ),
                  keyboardType: TextInputType.number,
                  // Validasi
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'NIM tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // TextFormField untuk Tahun Lahir
                TextFormField(
                  controller: _tahunLahirController,
                  decoration: const InputDecoration(
                    labelText: 'Tahun Lahir',
                    prefixIcon: Icon(Icons.calendar_today_outlined),
                    hintText: 'Masukkan tahun lahir Anda',
                  ),
                  keyboardType: TextInputType.number,
                  // Validasi
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tahun lahir tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                // Tombol untuk submit
                ElevatedButton(
                  onPressed: _kirimData, // Panggil fungsi _kirimData
                  child: const Text('Kirim Data'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}