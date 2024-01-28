import 'package:carousel_slider/carousel_slider.dart';
import 'package:ebook/model/ProfileModel.dart';
import 'package:ebook/pages/ContohSoalScreen.dart';
import 'package:ebook/pages/LatihanSoalScreen.dart';
import 'package:ebook/pages/MateriScreen.dart';
import 'package:ebook/pages/ProfilePageScreen.dart';
import 'package:ebook/pages/VideoScreen.dart';
import 'package:ebook/widget/CustomButtomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imageList = [
    'images/image1.jpg',
    'images/image2.jpg',
    'images/image3.png',
  ];

  final List<String> menuItems = [
    'Materi',
    'Contoh Soal',
    'Video Pembelajaran',
    'Latihan Soal',
    'Profile',
    'About Us',
  ];

  String userName = ''; // Inisialisasi variabel untuk nama pengguna

  @override
  void initState() {
    super.initState();
    _loadUserName(); // Memanggil fungsi untuk mengambil nama pengguna dari SharedPreferences
  }

  Future<void> _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUserName = prefs.getString('name');

    if (storedUserName != null && storedUserName.isNotEmpty) {
      setState(() {
        userName = storedUserName;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Physics Fun'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              userName.isNotEmpty ? 'Selamat Datang, $userName' : '',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: imageList
                  .map((item) => Container(
                        child: Center(
                            child: Image.asset(item,
                                fit: BoxFit.cover, width: 1000)),
                      ))
                  .toList(),
            ),
            SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (menuItems[index] == 'Materi') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MateriClass()),
                      );
                    } else if (menuItems[index] == 'Contoh Soal') {
                      // This is where you navigate to ContohSoal
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContohSoal()),
                      );
                    } else if (menuItems[index] == 'Latihan Soal') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LatihanSoalPage()),
                      );
                    } else if (menuItems[index] == 'Video Pembelajaran') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VideoPlayerScreen()),
                      );
                    } else if (menuItems[index] == 'Profile') {
                      // Check if the selected item is 'Profile'
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfilePage(
                                service:
                                    ProfileService())), // Assuming ProfileService is required
                      );
                    }
                  },
                  child: Card(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          menuItems[index],
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
