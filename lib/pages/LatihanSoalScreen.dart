import 'package:ebook/model/LatihanSoalModel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LatihanSoalPage extends StatefulWidget {
  @override
  _LatihanSoalPageState createState() => _LatihanSoalPageState();
}

class _LatihanSoalPageState extends State<LatihanSoalPage> {
  int _currentIndex = 0;
  final PageController _controller = PageController();
  List<Soal> soal = latihanSoal;
  int skor = 0;
  bool sudahMengirim = false;
  List<String?> jawabanPengguna = List.filled(latihanSoal.length, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Soal'),
      ),
      body: PageView.builder(
        controller: _controller,
        itemCount: soal.length,
        itemBuilder: (context, index) {
          Soal currentSoal = soal[index];
          return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Soal ${currentSoal.nomor}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  currentSoal.text,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                Column(
                  children: currentSoal.options.map((option) {
                    return RadioListTile(
                      title: Text(option['text']),
                      value: option['text'],
                      groupValue: jawabanPengguna[index],
                      onChanged: (value) {
                        setState(() {
                          jawabanPengguna[index] = value;
                        });
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 16.0),
                if (currentSoal.hasImage)
                  Image.asset(
                    currentSoal.imageUrl!,
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          if (!sudahMengirim && _currentIndex > 0)
            FloatingActionButton(
              onPressed: _prevQuestion,
              child: Icon(Icons.arrow_back),
            ),
          FloatingActionButton(
            onPressed: _nextQuestionWithValidation,
            child: Icon(Icons.arrow_forward),
          ),
          if (sudahMengirim)
            FloatingActionButton(
              onPressed: _hitungNilai,
              child: Icon(Icons.send),
            ),
          if (!sudahMengirim && _currentIndex >= 24)
            FloatingActionButton(
              onPressed: _kirimHasil,
              child: Icon(Icons.send),
            ),
        ],
      ),
    );
  }

  void _prevQuestion() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
      _controller.animateToPage(_currentIndex,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _nextQuestion() {
    if (_currentIndex < soal.length - 1) {
      setState(() {
        _currentIndex++;
      });
      _controller.animateToPage(_currentIndex,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _nextQuestionWithValidation() {
    // Periksa apakah pengguna telah memilih jawaban untuk pertanyaan saat ini
    if (jawabanPengguna[_currentIndex] == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Peringatan"),
            content: Text("Anda belum memilih jawaban."),
            actions: [
              TextButton(
                child: Text("Tutup"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      _nextQuestion();
    }
  }

  void _hitungNilai() async {
    int jumlahBenar = 0;
    skor = 0;
    for (int i = 0; i < soal.length; i++) {
      Soal currentSoal = soal[i];
      if (jawabanPengguna[i] != null &&
          jawabanPengguna[i] ==
              currentSoal.options
                  .firstWhere((option) => option['isCorrect'])['text']) {
        jumlahBenar++;
        skor += 4;
      }
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('nama', 'Nama Pengguna');
    await prefs.setInt('skor', skor);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Hasil Akhir"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Jawaban benar: $jumlahBenar dari ${soal.length} soal."),
              Text("Skor Anda: $skor"),
            ],
          ),
          actions: [
            TextButton(
              child: Text("Tutup"),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  sudahMengirim = true;
                });
              },
            ),
          ],
        );
      },
    );
  }

  void _kirimHasil() {
    setState(() {
      sudahMengirim = true;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
