import 'package:flutter/material.dart';
import 'package:tugaspertemuan3/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var namauser;

  Future<void> _saveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _usernameController.text);
  }

  Widget _showInput(TextEditingController namacontroller, String label,
      String placeholder, bool isPassword) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: namacontroller,
          obscureText: isPassword,
          style: const TextStyle(color: Colors.red),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: const TextStyle(color: Colors.white70),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Future<void> _showDialog(String pesan, Widget alamat) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: Text(pesan, style: const TextStyle(color: Colors.white)),
          actions: [
            TextButton(
              child: const Text('OK', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => alamat,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://example.com/marvel_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header di bagian atas
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.red.withOpacity(0.8),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.sports_esports, color: Colors.white, size: 30),
                    SizedBox(width: 10),
                    Text(
                      'SufyanGaming - Login',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              // Spacer untuk membuat jarak antara header dan input
              const Spacer(),
              // Bagian input berada di tengah secara vertikal
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _showInput(_usernameController, 'Masukkan Username',
                        'Enter Username', false),
                    const SizedBox(height: 20),
                    _showInput(_passwordController, 'Masukkan Password',
                        'Enter Password', true),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                      ),
                      child: const Text('Login'),
                      onPressed: () async {
                        if (_usernameController.text == 'admin' &&
                            _passwordController.text == 'admin') {
                          await _saveUsername();
                          await _showDialog(
                              'Login Successful', const HomePage());
                        } else {
                          await _showDialog('Invalid Username or Password',
                              const LoginPage());
                        }
                      },
                    ),
                  ],
                ),
              ),
              // Spacer untuk membuat jarak antara input dan bagian bawah layar
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
