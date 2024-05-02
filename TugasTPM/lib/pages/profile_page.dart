import 'package:flutter/material.dart';

class User {
  final String name;
  final String nim;
  final String imageAsset;

  User({required this.name, required this.nim, required this.imageAsset});
}

class ProfilePage extends StatelessWidget {
  final List<User> users = [
    User(
      name: "Muhammad Ahnaf Ardiansyah",
      nim: "123210069",
      imageAsset: "assets/images/ahnaf-1.jpg",
    ),
    User(
      name: "Ahmad Yuda Hermawan",
      nim: "123210075",
      imageAsset: "assets/images/yuda.jpg",
    ),
    User(
      name: "Gregorius Rafael Santosa",
      nim: "123210102",
      imageAsset: "assets/images/rafael.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
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
                )
              ],
            ),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              leading: CircleAvatar(
                backgroundImage: AssetImage(users[index].imageAsset),
              ),
              title: Text(
                users[index].name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 18),
              ),
              subtitle: Text(
                'NIM: ${users[index].nim}',
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ),
          );
        },
      ),
    );
  }
}
