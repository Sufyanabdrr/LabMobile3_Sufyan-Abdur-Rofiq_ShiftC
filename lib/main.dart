import 'package:flutter/material.dart';
import 'package:tugaspertemuan3/login_page.dart';
import 'package:tugaspertemuan3/home_page.dart';
import 'package:tugaspertemuan3/about_page.dart';
import 'package:tugaspertemuan3/sidemenu.dart';
import 'package:tugaspertemuan3/mission_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Tugas Pertemuan 3",
      home: LoginPage(),
    );
  }
}
