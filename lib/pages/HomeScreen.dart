import 'package:carousel_slider/carousel_slider.dart';
import 'package:ebook/pages/ContohSoalScreen.dart';
import 'package:ebook/pages/LatihanSoalScreen.dart';
import 'package:ebook/pages/MateriScreen.dart';
import 'package:ebook/pages/VideoScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Physics Fun'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
