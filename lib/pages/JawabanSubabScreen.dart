import 'package:ebook/model/ContohSoalModel.dart';
import 'package:flutter/material.dart';

class SoalPage extends StatefulWidget {
  final int subBabIndex;

  SoalPage({required this.subBabIndex});
  @override
  _SoalPageState createState() => _SoalPageState();
}

class _SoalPageState extends State<SoalPage> {
  int currentSoalIndex = 0;
  Map<String, dynamic> currentSoal = {}; // Data soal yang sedang ditampilkan

  @override
  Widget build(BuildContext context) {
    if (currentSoalIndex >= 0 && currentSoalIndex < contohSoalListJson.length) {
      currentSoal = contohSoalListJson[currentSoalIndex];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Contoh Soal'),
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Soal ${currentSoalIndex + 1}', // Angka soal dinamis
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      currentSoal['isi'] ?? '', // Isi soal dari JSON
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Penyelesaian:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      currentSoal['penyelesaian'] ??
                          '', // Penyelesaian soal dari JSON
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900], // Warna biru tua untuk tombol
                  ),
                  onPressed: () {
                    setState(() {
                      if (currentSoalIndex > 0) {
                        currentSoalIndex--;
                      }
                    });
                  },
                  child: Text('Kembali'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900], // Warna biru tua untuk tombol
                  ),
                  onPressed: () {
                    setState(() {
                      if (currentSoalIndex < contohSoalListJson.length - 1) {
                        currentSoalIndex++;
                      }
                    });
                  },
                  child: Text('Selanjutnya'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
