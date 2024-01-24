class Soal {
  final int nomor;
  final String text;
  final List<Map<String, dynamic>> options; // Perubahan tipe data
  final String? imageUrl; // Opsi adalah nullable

  Soal({
    required this.nomor,
    required this.text,
    required this.options,
    this.imageUrl,
  });

  // Konstruktor dari JSON
  factory Soal.fromJson(Map<String, dynamic> json) {
    return Soal(
      nomor: json['nomor'],
      text: json['text'],
      options: List<Map<String, dynamic>>.from(json['options']),
      imageUrl: json['imageUrl'],
    );
  }

  // Konversi ke JSON
  Map<String, dynamic> toJson() {
    return {
      'nomor': nomor,
      'text': text,
      'options': options, // Tidak perlu perubahan
      'imageUrl': imageUrl ?? '',
    };
  }

  bool get hasImage => imageUrl != null && imageUrl!.isNotEmpty;
}

// Contoh pembuatan daftar soal
List<Soal> latihanSoal = [
  Soal(
    nomor: 1,
    text:
        'Selang dengan luas penampang besar dan kecil berturut-turut 400 cm2 dan 50 cm2 dialiri air dengan kelajuan 2 m/s pada luas penampang besarnya. Volume air yang keluar pada luas penampang kecil selama 5 menit adalah . . .',
    options: [
      {'text': 'a. 16 m3', 'isCorrect': false},
      {'text': 'b. 18 m3', 'isCorrect': false},
      {'text': 'c. 20 m3', 'isCorrect': false},
      {'text': 'd. 22 m3', 'isCorrect': false},
      {'text': 'e. 24 m3', 'isCorrect': true},
    ],
  ),
  Soal(
    nomor: 2,
    text:
        'Diketahui sebuah pipa air dengan luas penampang 10 cm2 dan kecepatan air yang mengalir pada pipa 1 m/s. Lamanya waktu yang diperlukan untuk mengalirkan air dengan volume 2 m3 adalah . . .',
    options: [
      {'text': 'a. 3 jam', 'isCorrect': false},
      {'text': 'b. 2 jam', 'isCorrect': false},
      {'text': 'c. 1,5 jam', 'isCorrect': false},
      {'text': 'd. 1 jam', 'isCorrect': false},
      {'text': 'e. 0.5 jam', 'isCorrect': true},
    ],
  ),
  Soal(
    nomor: 3,
    text: 'Aliran yang tidak bergantung waktu disebut aliran',
    options: [
      {'text': 'a. Steady', 'isCorrect': true},
      {'text': 'b. Turbulen', 'isCorrect': false},
      {'text': 'c. Non-turbulen', 'isCorrect': false},
      {'text': 'd. Laminar', 'isCorrect': false},
      {'text': 'e. Non-Viskos', 'isCorrect': false},
    ],
  ),
  Soal(
    nomor: 4,
    text:
        'Sebuah pipa silinder diletakkan mendatar dan dialiri kecepatan aliran di A = 3 m/s dan di B = 5 m/s. Jika tekanan di penampang A =  105 N/m2, maka tekanan di penampang B adalah . . .',
    options: [
      {'text': 'a. 9.1 x 10^4 N/m^2', 'isCorrect': true},
      {'text': 'b. 10.45 x 10^4 N/m^2', 'isCorrect': false},
      {'text': 'c. 11.8 x 10^4 N/m^2', 'isCorrect': false},
      {'text': 'd. 13,5 x 10^4 N/m^2', 'isCorrect': false},
      {'text': 'e. 19.0 x 10^4 N/m^2', 'isCorrect': false},
    ],
  ),
  Soal(
    nomor: 5,
    text:
        'Berikut yang bukan merupakan alat-alat yang menerapkan prinsip hukum Bernoulli adalah . . .',
    options: [
      {'text': 'a. Alat penyemprot', 'isCorrect': false},
      {'text': 'b. Gaya angkat sayap pesawat terbang', 'isCorrect': false},
      {'text': 'c. Venturimeter', 'isCorrect': false},
      {'text': 'd. Pompa Hidrolik', 'isCorrect': true},
      {'text': 'e. Karburator', 'isCorrect': false},
    ],
  ),
  Soal(
    nomor: 6,
    text:
        'Sebuah bak penampungan berisi air setinggi 1 meter (g = 10 m/s2) dan pada dinding terdapat lubang kebocoran seperti terlihat pada gambar. Besar kelajuan air yang keluar dari lubang tersebut adalah . . .',
    options: [
      {'text': 'a. 1 m/s', 'isCorrect': false},
      {'text': 'b. 2 m/s', 'isCorrect': false},
      {'text': 'c. 3 m/s', 'isCorrect': false},
      {'text': 'd. 4 m/s', 'isCorrect': true},
      {'text': 'e. 5 m/s', 'isCorrect': false},
    ],
  ),
  Soal(
    nomor: 7,
    text:
        'Air mengalir melalui sebuah pipa yang berbentuk corong. Garis tengah lubang corong dimana air itu masuk 30 cm. Dan garis tengah lubang corong dimana air itu keluar 15 cm. Letak pusat lubang pipa yang lebih kecil lebih rendah 60 cm daripada pusat lubang yang besar. Jika cepat aliran air dalam pipa itu 140 liter/detik, sedangkan tekanannya pada lubang yang besar 77,5 cmHg. Besarnya tekanan pada lubang yang kecil adalah . . .',
    options: [
      {'text': 'a. 59,9 cmHg', 'isCorrect': true},
      {'text': 'b. 52,7 cmHg', 'isCorrect': false},
      {'text': 'c. 43,5 cmHg', 'isCorrect': false},
      {'text': 'd. 40,2 cmHg', 'isCorrect': false},
      {'text': 'e. 38,4 cmHg', 'isCorrect': false},
    ],
  ),
  Soal(
    nomor: 8,
    text:
        'Sebuah pipa air digunakan untuk mengisi drum hingga penuh. Jika dengan luas penampang pipa 10 cm2 dan volume 2 m3 dimana kecepatan air pada pipa 2 m/s, maka drum terisi penuh selama . . .',
    options: [
      {'text': 'a. 0,0001 s', 'isCorrect': false},
      {'text': 'b. 1000 s', 'isCorrect': true},
      {'text': 'c. 0,01 s', 'isCorrect': false},
      {'text': 'd. 100 s', 'isCorrect': false},
      {'text': 'e. 0,1 s', 'isCorrect': false},
    ],
  ),
  Soal(
    nomor: 9,
    text:
        'Sebuah semprotan nyamuk tersusun atas pipa vertikal yang tercelup dalam cairan anti nyamuk ρ dan pipa horizontal yang terhubung dengan piston. Panjang bagian pipa vertikal yang berada di atas cairan adalah l dengan luas penampang a. Dibutuhkan kecepatan minimum aliran udara yang keluar dari pipa horizontal sebesar v agar cairan antinyamuk dapat keluar dari pipa vertikal. Jika penyemprot rusak sehingga kecepatan aliran udara yang keluar berubah menjadi v^\'=0,6v, maka panjang bagian pipa l maksimum agar semprotan ini tetap berfungsi adalah . . .',
    options: [
      {'text': 'a. l^\'=1/6 l', 'isCorrect': false},
      {'text': 'b. l^\'=0,6l', 'isCorrect': false},
      {'text': 'c. l^\'=√(1/6) l', 'isCorrect': false},
      {'text': 'd. l^\'=0,36l', 'isCorrect': true},
      {'text': 'e. l^\'=1/0,36 l', 'isCorrect': false},
    ],
  ),
  Soal(
    nomor: 10,
    text:
        'Bak air yang volumenya 200 liter diisi penuh dengan air. Pengisian bak tersebut menggunakan keran dengan luas penampang 8 cm2. Jika bak air tersebut terisi penuh setelah diisi selama 20 sekon, kelajuan aliran air kerannya adalah . . .',
    options: [
      {'text': 'a. 12,5 m/s', 'isCorrect': true},
      {'text': 'b. 15 m/s', 'isCorrect': false},
      {'text': 'c. 20 m/s', 'isCorrect': false},
      {'text': 'd. 22,5 m/s', 'isCorrect': false},
      {'text': 'e. 25 m/s', 'isCorrect': false},
    ],
  ),
  Soal(
    nomor: 11,
    text:
        'Sayap pesawat terbang memiliki luas total 100 cm2. Pesawat tersebut bergerak sehingga menghasilkan perbedaan kecepatan aliran udara di bagian atas dan bawah sayap berturut-turut 150 m/s dan 50 m/s. Jika massa jenis udara 1,3 kg/m3, besar gaya angkatnya adalah . . .',
    options: [
      {'text': 'a. 13.00 N', 'isCorrect': false},
      {'text': 'b. 1.300 N', 'isCorrect': false},
      {'text': 'c. 130 N', 'isCorrect': true},
      {'text': 'd. 13 N', 'isCorrect': false},
      {'text': 'e. 1 N', 'isCorrect': false},
    ],
  ),
  Soal(
    nomor: 12,
    text:
        'Jika air dalam tangki memancar keluar dari lubang A yang terletak pada dasar bejana, tinggi air (h) adalah . . . (g = 10 m/s2)',
    options: [
      {'text': 'a. 6 m', 'isCorrect': false},
      {'text': 'b. 4,5 m', 'isCorrect': false},
      {'text': 'c. 4 m', 'isCorrect': false},
      {'text': 'd. 3 m', 'isCorrect': true},
      {'text': 'e. 1,5 m', 'isCorrect': false},
    ],
    imageUrl: 'images/no12.png',
  ),
  Soal(
    nomor: 13,
    text:
        'Pernyataan mengenai gaya angkat pesawat terbang yang benar ditunjukkan oleh pernyataan . . .',
    options: [
      {
        'text': 'a. Luas sayap tidak memengaruhi gaya angkat',
        'isCorrect': false
      },
      {
        'text': 'b. Tekanan udara bukan faktor yang berpengaruh',
        'isCorrect': false
      },
      {
        'text':
            'c. Tekanan udara di bawah sayap pesawat lebih kecil dari atas pesawat',
        'isCorrect': false
      },
      {
        'text':
            'd. Kecepatan aliran udara di bawah sayap pesawat lebih kecil dari atas pesawat',
        'isCorrect': true
      },
      {
        'text':
            'e. Kecepatan aliran udara di bagian atas maupun bagian bawah sayap tidak berpengaruh',
        'isCorrect': false
      },
    ],
  ),
  Soal(
    nomor: 14,
    text:
        'Sebuah pesawat mempunyai lebar sayap total 15 m2. Jika kecepatan aliran udara di atas dan di bawah sayap masing-masing 60 m/s dan 30 m/s serta massa jenis udara 1,2 kg/m3. Besarnya gaya ke atas yang dialami pesawat adalah . . .',
    options: [
      {'text': 'a. 16.200 N', 'isCorrect': false},
      {'text': 'b. 20.100 N', 'isCorrect': false},
      {'text': 'c. 24.300 N', 'isCorrect': true},
      {'text': 'd. 30.500 N', 'isCorrect': false},
      {'text': 'e. 34.600 N', 'isCorrect': false},
    ],
  ),
  Soal(
    nomor: 15,
    text:
        'Seorang anak mengisi sebuah ember yang memiliki volume 0,019 m3 dengan menggunakan keran yang memiliki diameter 0,008 m. Apabila air keluar dari keran dengan laju tetap 0,61 m/s, maka waktu yang diperlukan untuk memenuhi ember tersebut adalah . . .',
    options: [
      {'text': 'a. 5,16 menit', 'isCorrect': false},
      {'text': 'b. 10,33 menit', 'isCorrect': true},
      {'text': 'c. 15,45 menit', 'isCorrect': false},
      {'text': 'd. 17,90 menit', 'isCorrect': false},
      {'text': 'e. 20,66 menit', 'isCorrect': false},
    ],
  ),
  Soal(
    nomor: 16,
    text:
        'Air mengalir dari pipa A ke pipa B lalu ke pipa C. Perbandingan luas penampang pipa A dan luas penampang pipa C adalah 5 : 3. Jika laju aliran air pada pipa A sama dengan 2v, maka laju aliran minyak pada pipa C adalah . . .',
    options: [
      {'text': 'a. 3/10 v', 'isCorrect': false},
      {'text': 'b. 10/3 v', 'isCorrect': true},
      {'text': 'c. 2 v', 'isCorrect': false},
      {'text': 'd. 5 v', 'isCorrect': false},
      {'text': 'e. 9 v', 'isCorrect': false},
    ],
  ),
  Soal(
    nomor: 17,
    text:
        'Di dalam sebuah tabung terdapat zat cair (ideal). Terdapat dua lubang kecil (jauh lebih kecil dari penampang tabung) pada dinding tabung, sehingga membuat zat cair memancar melalui lubang tersebut (terlihat seperti pada gambar). Perbandingan antara x1 dan x2 adalah . . .',
    options: [
      {'text': 'a. 1 : 3', 'isCorrect': false},
      {'text': 'b. 3 : 1', 'isCorrect': false},
      {'text': 'c. 4 : 5', 'isCorrect': true},
      {'text': 'd. 2 : 3', 'isCorrect': false},
      {'text': 'e. 3 : 2', 'isCorrect': false},
    ],
    imageUrl: 'images/no17.png',
  ),
  Soal(
    nomor: 18,
    text: 'Alat penyemprot serangga dan parfum memanfaatkan konsep Hukum . . .',
    options: [
      {'text': 'a. Pascal', 'isCorrect': false},
      {'text': 'b. Bernoulli', 'isCorrect': true},
      {'text': 'c. Archimedes', 'isCorrect': false},
      {'text': 'd. Hidrostatika', 'isCorrect': false},
      {'text': 'e. Stokes', 'isCorrect': false},
    ],
  ),
  Soal(
    nomor: 19,
    text:
        'Tekanan dan kecepatan udara di atas sayap pesawat masing-masing  P1 dan v1, sedangkan di bawah sayap adalah P2 dan v2. Agar sayap pesawat dapat mengangkat pesawat, persamaan berikut yang benar adalah . . .',
    options: [
      {'text': 'a. P1 < P2 dan v1 > v2', 'isCorrect': true},
      {'text': 'b. P1 < P2 dan v1 < v2', 'isCorrect': false},
      {'text': 'c. P1 = P2 dan v1 > v2', 'isCorrect': false},
      {'text': 'd. P1 > P2 dan v1 > v2', 'isCorrect': false},
      {'text': 'e. P1 > P2 dan v1 = v2', 'isCorrect': false},
    ],
  ),
  Soal(
    nomor: 20,
    text: 'Jika zat cair melalui sebuah pipa yang makin menyempit maka....',
    options: [
      {
        'text': 'a. Zat cair akan mengalami suatu percepatan',
        'isCorrect': true
      },
      {
        'text': 'b. Zat cair akan mengalami suatu perlambatan',
        'isCorrect': false
      },
      {
        'text': 'c. Tekanan di dalam aliran zat cair semakin besar',
        'isCorrect': false
      },
      {
        'text': 'd. Tekanan di dalam aliran zat cair dimana-mana sama besar',
        'isCorrect': false
      },
      {'text': 'e. Zat cair akan diam', 'isCorrect': false},
    ],
  ),
  Soal(
    nomor: 21,
    text:
        'Pipa venturi tertutup dengan manometer mempunyai luas penampang masing-masing 25 cm2 dan 5 cm2. Jika perbedaan tinggi raksa 6 cm, massa jenis raksa 13,6 g/cm3 dan massa jenis air 1 g/cm3, besar kecepatan air yang keluar dari penampang kecil adalah . . .',
    options: [
      {'text': 'a. 2 m/s', 'isCorrect': false},
      {'text': 'b. 4 m/s', 'isCorrect': true},
      {'text': 'c. 8 m/s', 'isCorrect': false},
      {'text': 'd. 16 m/s', 'isCorrect': false},
      {'text': 'e. 32 m/s', 'isCorrect': false},
    ],
  ),
  Soal(
    nomor: 22,
    text:
        'Keran pada dispenser memiliki luas penampang 2 cm2 dan menghadap ke bawah. Ketika keran dibuka, diperlukan waktu 5 sekon untuk mengisi penuh gelas beukuran 250 cm3 (waktu dihitung sejak air menyentuh dasar gelas). Dengan asumsi air mengalir seperti fluida ideal, besar kecepatan air yang keluar dari keran adalah . . .',
    options: [
      {'text': 'a. 25 cm/s', 'isCorrect': true},
      {'text': 'b. 30 cm/s', 'isCorrect': false},
      {'text': 'c. 40 cm/s', 'isCorrect': false},
      {'text': 'd. 50 cm/s', 'isCorrect': false},
      {'text': 'e. 60 cm/s', 'isCorrect': false},
    ],
  ),
  Soal(
    nomor: 23,
    text:
        'Pipa mendatar yang memiliki luas penampang 10 cm2 disambungkan ke pipa lainnya yang mendatar juga dengan luas penampang 15 cm2. Jika kecepatan air dalam pipa kecil adalah 6 m/s dan besar tekanan di tempat tersebut 200 kPa, besar tekanan dalam pipa adalah . . .',
    options: [
      {'text': 'a. 180 kPa', 'isCorrect': false},
      {'text': 'b. 210 kPa', 'isCorrect': true},
      {'text': 'c. 220 kPa', 'isCorrect': false},
      {'text': 'd. 230 kPa', 'isCorrect': false},
      {'text': 'e. 240 kPa', 'isCorrect': false},
    ],
  ),
  Soal(
    nomor: 24,
    text:
        'Bejana berbentuk silinder diisi penuh dengan air setinggi 2 m. Pada ketinggian 20 cm dari dasar bejana terdapat lubang kebocoran kecil. Jika g = 10 m/s2, maka volume air yang mengalir selama 1 menit jika luas lubang 5 cm2 adalah . . .',
    options: [
      {'text': 'a. 180 liter', 'isCorrect': true},
      {'text': 'b. 200 liter', 'isCorrect': false},
      {'text': 'c. 220 liter', 'isCorrect': false},
      {'text': 'd. 240 liter', 'isCorrect': false},
      {'text': 'e. 250 liter', 'isCorrect': false},
    ],
  ),
  Soal(
    nomor: 25,
    text:
        'Silinder lurus dengan luas penampang besar dan kecil berturut-turut 10 cm2 dan 5 cm2 diletakkan mendatar. Jika kelajuan air pada penampang besar adalah 3 m/s, kelajuan air pada penampang kecil adalah . . .',
    options: [
      {'text': 'a. 1,5 m/s', 'isCorrect': false},
      {'text': 'b. 3 m/s', 'isCorrect': false},
      {'text': 'c. 4 m/s', 'isCorrect': false},
      {'text': 'd. 6 m/s', 'isCorrect': true},
      {'text': 'e. 12 m/s', 'isCorrect': false},
    ],
  ),
];

// Mengonversi daftar soal ke format List<Map<String, dynamic>> untuk JSON
List<Map<String, dynamic>> contohSoalListJson =
    latihanSoal.map((soal) => soal.toJson()).toList();

// Filter untuk mendapatkan soal yang memiliki gambar
List<Soal> soalDenganGambar =
    latihanSoal.where((soal) => soal.hasImage).toList();

// Filter untuk mendapatkan soal yang tidak memiliki gambar
List<Soal> soalTanpaGambar =
    latihanSoal.where((soal) => !soal.hasImage).toList();
