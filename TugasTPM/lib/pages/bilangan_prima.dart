import 'package:flutter/material.dart';

class BilanganPrimaPage extends StatefulWidget {
  @override
  _BilanganPrimaPageState createState() => _BilanganPrimaPageState();
}

class _BilanganPrimaPageState extends State<BilanganPrimaPage> {
  TextEditingController numberController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cek Bilangan Prima'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Cek Bilangan Prima',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Aplikasi ini untuk mengecek Apakah suatu bilangan merupakan bilangan prima atau tidak',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.shade100,
                      offset: Offset(4.0, 4.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4.0, -4.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: TextField(
                  controller: numberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Masukkan Angka',
                  ),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  String input = numberController.text;
                  if (input.isEmpty || int.tryParse(input) == null) {
                    setState(() {
                      result = 'Inputan harus angka';
                    });
                  } else {
                    int number = int.parse(input);
                    setState(() {
                      if (isPrime(number)) {
                        result = 'Angka $number adalah bilangan prima';
                      } else {
                        result = 'Angka $number bukan bilangan prima';
                      }
                    });
                  }
                },
                child: const Text('Cek Bilangan Prima'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // backgroundColor: Colors.blue,
                  // foregroundColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(result),
            ],
          ),
        ),
      ),
    );
  }
  
  bool isPrime(int number) {
    if (number <= 1) {
      return false;
    }
    for (int i = 2; i <= number / 2; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }
}
