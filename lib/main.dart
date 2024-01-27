import 'package:ebook/pages/VideoScreen.dart';
import 'package:flutter/material.dart';
import 'package:ebook/pages/HomeScreen.dart';
import 'package:ebook/pages/MateriScreen.dart'; // Pastikan Anda telah membuat halaman ini
import 'package:ebook/pages/ContohSoalScreen.dart'; // Pastikan Anda telah membuat halaman ini
import 'package:ebook/pages/VideoPembelajaranScreen.dart'; // Pastikan Anda telah membuat halaman ini
import 'package:ebook/pages/LatihanSoalScreen.dart';
import 'package:ebook/pages/ProfileScreen.dart'; // Pastikan Anda telah membuat halaman ini

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi E-book Fisika',
      home: HomeScreen(),
    );
  }
}
