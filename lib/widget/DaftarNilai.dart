import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DaftarNilaiWidget extends StatefulWidget {
  @override
  _DaftarNilaiWidgetState createState() => _DaftarNilaiWidgetState();
}

class _DaftarNilaiWidgetState extends State<DaftarNilaiWidget> {
  int skor = 0;

  @override
  void initState() {
    super.initState();
    _loadDataNilai();
  }

  Future<void> _loadDataNilai() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      skor = prefs.getInt('skor') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Nilai'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'HASIL SKOR TERKAHIR ANDA',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Skor: $skor',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
