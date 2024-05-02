import 'package:flutter/material.dart';
import 'package:tugas1/pages/bilangan_prima.dart';
import 'package:tugas1/pages/kalkulator_segitiga.dart';
import 'package:tugas1/pages/profile_page.dart';
import 'package:tugas1/pages/situs_rekomendasi_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  String? _userEmail = 'user';

  @override
  void initState() {
    super.initState();
    _getUserEmail();
  }

  void _getUserEmail() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    _userEmail = prefs.getString('user');

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Selamat datang, $_userEmail',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            HomeMenuItem(
              title: 'Daftar Anggota',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            HomeMenuItem(
              title: 'Aplikasi menampilkan bilangan prima',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BilanganPrimaPage()),
                );
              },
            ),
            HomeMenuItem(
              title: 'Aplikasi Penghitung Luas dan Keliling Segitiga',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SegitigaPage()),
                );
              },
            ),
            HomeMenuItem(
              title: 'Daftar Situs Rekomendasi',
              onTap: () {
                // Tambahkan logika navigasi untuk menu ini
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SitusRecommendationPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomeMenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const HomeMenuItem({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
