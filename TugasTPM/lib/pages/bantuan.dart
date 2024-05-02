import 'package:flutter/material.dart';

class Bantuan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bantuan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Cara Penggunaan Aplikasi:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '1. Pilih menu yang ingin Anda gunakan dari Beranda.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2. Masukkan nilai yang diperlukan dan tekan tombol "Hitung" untuk mendapatkan hasil.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '3. Untuk keluar dari aplikasi, tekan tombol Logout di bagian bawah layar.',
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
