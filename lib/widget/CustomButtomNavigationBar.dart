import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex; // Indeks halaman aktif
  final Function(int) onTap; // Fungsi yang akan dipanggil ketika item diklik

  // Daftar item dalam BottomNavigationBar
  final List<BottomNavigationBarItem> items;

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed, // Untuk lebih dari 3 item
      items: items,
      onTap: onTap, // Panggil fungsi onTap yang diberikan
    );
  }
}
