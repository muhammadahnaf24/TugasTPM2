import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  final String username, password;
  LoginScreen({Key? key, required this.username, required this.password})
      : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 400,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _headerContainer(),
                  const SizedBox(height: 20),
                  _usernameField(),
                  const SizedBox(height: 20),
                  _passwordField(),
                  const SizedBox(height: 20),
                  _loginButton(widget.username, widget.password),
                  const SizedBox(height: 20),
                  _registerButton(widget.username, widget.password),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerContainer() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: const Text(
        'LOGIN',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 30.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: _usernameController,
        autofocus: true,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blue, width: 2.5),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: 'Email',
          prefixIcon: const Icon(
            Icons.account_circle_rounded,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blue, width: 2.5),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: 'Password',
          prefixIcon: const Icon(
            Icons.password_outlined,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _loginButton(String checkUser, String checkPass) {
    return Container(
      width: 200,
      height: 45,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        onPressed: () {
          String users = _usernameController.text;
          String pass = _passwordController.text;
          String text = "";
          if (users.isEmpty || pass.isEmpty) {
            text = "Login Failed, please enter your name and password";
          } else if (users == "user" || pass == "pass") {
            _saveUserToSharedPreferences(users);
            Navigator.pushNamed(context, '/home');
            text = "Login Success";
          } else if (users != checkUser || pass != checkPass) {
            text = "Login Failed, your username or password is wrong";
          } else {
            Navigator.pushNamed(context, '/home');
            text = "Login Success";
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(text),
            ),
          );
        },
      ),
    );
  }

  void _saveUserToSharedPreferences(String user) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('username', user);
  }

  Widget _registerButton(String checkUser, String checkPass) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account ?",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
          ),
        ),
        MaterialButton(
          color: null,
          padding: const EdgeInsets.all(20),
          onPressed: () {},
          child: const Text(
            "Register",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}