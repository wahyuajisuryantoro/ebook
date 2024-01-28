import 'package:ebook/model/ProfileModel.dart';
import 'package:ebook/pages/ProfilePageScreen.dart';
import 'package:ebook/pages/VideoScreen.dart';
import 'package:ebook/widget/CustomButtomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:ebook/pages/HomeScreen.dart';
import 'package:ebook/pages/MateriScreen.dart';
import 'package:ebook/pages/ContohSoalScreen.dart';
import 'package:ebook/pages/VideoPembelajaranScreen.dart';
import 'package:ebook/pages/LatihanSoalScreen.dart';
import 'package:ebook/pages/ProfileScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi E-book Fisika',
      home: MainScreen(), // Menggunakan MainScreen sebagai tampilan utama
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0; // Indeks halaman aktif

  // Daftar halaman yang akan ditampilkan di BottomNavigationBar
  final List<Widget> _pages = [
    HomeScreen(),
    MateriClass(),
    ContohSoal(),
    VideoPlayerScreen(),
    LatihanSoalPage(),
    ProfilePage(
      service: ProfileService(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplikasi E-book Fisika"),
      ),
      body: _pages[
          _currentIndex], // Menampilkan halaman sesuai dengan indeks aktif
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Mengubah indeks aktif saat item diklik
          });
        },
        items: [
          // Item untuk Home
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // Item untuk Materi
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Materi',
          ),
          // Item untuk Contoh Soal
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Contoh Soal',
          ),
          // Item untuk Video Pembelajaran
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Video Pembelajaran',
          ),
          // Item untuk Latihan Soal
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Latihan Soal',
          ),
          // Item untuk Profile
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
