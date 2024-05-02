import 'package:flutter/material.dart';

class SegitigaPage extends StatefulWidget {
  @override
  _SegitigaPageState createState() => _SegitigaPageState();
}

class _SegitigaPageState extends State<SegitigaPage> {
  TextEditingController alasController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();
  String luas = '';
  String keliling = '';
  bool _showResult = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penghitung Luas dan Keliling Segitiga'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: alasController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan panjang alas',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: tinggiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan tinggi segitiga',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double alas = double.tryParse(alasController.text) ?? 0;
                double tinggi = double.tryParse(tinggiController.text) ?? 0;
                double sisiMiring = _hitungSisiMiring(alas, tinggi);
                double kelilingSegitiga = alas + tinggi + sisiMiring;
                double luasSegitiga = _hitungLuas(alas, tinggi);
                setState(() {
                  luas = 'Luas: $luasSegitiga';
                  keliling = 'Keliling: $kelilingSegitiga';
                  _showResult = true;
                });
              },
              child: Text('Hitung'),
            ),
            SizedBox(height: 20),
            Visibility(
              visible: _showResult,
              child: ResultCard(
                title: 'Luas',
                value: luas,
              ),
            ),
            Visibility(
              visible: _showResult,
              child: ResultCard(
                title: 'Keliling',
                value: keliling,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk menghitung sisi miring segitiga
  double _hitungSisiMiring(double alas, double tinggi) {
    return (alas * alas + tinggi * tinggi) / 2;
  }

  // Fungsi untuk menghitung luas segitiga
  double _hitungLuas(double alas, double tinggi) {
    return 0.5 * alas * tinggi;
  }
}

class ResultCard extends StatelessWidget {
  final String title;
  final String value;

  const ResultCard({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
