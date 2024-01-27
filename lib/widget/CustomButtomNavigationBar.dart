import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;

  BottomNavBar({required this.selectedIndex});

  void _selectPage(BuildContext context, int index) {
    String routeName;
    switch (index) {
      case 0:
        routeName = '/materi';
        break;
      case 1:
        routeName = '/contohSoal';
        break;
      case 2:
        routeName = '/videoPembelajaran';
        break;
      case 3:
        routeName = '/latihanSoal';
        break;
      case 4:
        routeName = '/profile';
        break;
      default:
        routeName = '/';
    }

    if (ModalRoute.of(context)?.settings.name != routeName) {
      Navigator.pushReplacementNamed(context, routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: (index) => _selectPage(context, index),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Materi',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.question_answer),
          label: 'Contoh Soal',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_circle_fill),
          label: 'Video Pembelajaran',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit),
          label: 'Latihan Soal',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
