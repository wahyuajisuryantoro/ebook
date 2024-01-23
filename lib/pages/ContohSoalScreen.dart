import 'package:ebook/pages/JawabanSubabScreen.dart';
import 'package:flutter/material.dart';

class ContohSoal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contoh Soal'),
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  for (var i = 1; i <= 4; i++)
                    GestureDetector(
                      onTap: () {
                        // Navigasi ke halaman SoalPage saat item diklik
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SoalPage(subBabIndex: i - 1),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 16.0),
                        color: Colors.blue,
                        child: ListTile(
                          title: Text(
                            'Contoh Soal Sub Bab $i',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
