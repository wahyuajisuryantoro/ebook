class SubBab {
  final String judul;
  final String isi;

  SubBab({
    required this.judul,
    required this.isi,
  });

  Map<String, dynamic> toJson() {
    return {
      'judul': judul,
      'isi': isi,
    };
  }
}

List<SubBab> subBabList = [
  SubBab(
    judul: 'Sub Bab 1: Fluida Ideal',
    isi:
        'Fluida dinamik adalah ilmu yang membahas tentang gaya dan tekanan pada zat yang mengalir seperti air dan udara. Berikut merupakan ciri-ciri fluida ideal:\n\nAliran tunak atau aliran permanen (permanent flow) adalah kondisi dimana komponen aliran tidak berubah terhadap waktu. Contohnya adalah aliran di saluran/sungai pada kondisi tidak ada perubahan aliran (tidak ada hujan, tidak banjir, dll).\nTidak termampatkan (incompressible), yaitu fluida yang mengalir tidak mengalami perubahan volume atau massa jenis ketika ditekan.\nAliran yang tidak kental (non viscous), artinya aliran fluida ideal tidak mengalami gaya gesekan terhadap dinding bejana karena encer.\nLaminar, yaitu aliran memiliki garis arus dan tidak bergolak, artinya tiap partikel fluida akan melewati titik lintasan yang sama dengan arah yang sama.',
  ),
  SubBab(
    judul: 'Sub Bab 2: Persamaan Kontinuitas',
    isi:
        'Gerak fluida ideal dalam suatu tabung aliran harus sejajar dengan dinding walaupun besar kecepatannya berbeda. Misalkan fluida ideal mengalir dengan aliran stasioner melalui pipa seperti gambar 6.\n\nGambar 6. Aliran Fluida Stasioner\nFluida mengalir dari penampang besar A1 ke penampang kecil A2 dengan kecepatan masing-masing v1 dan v2 selama selang waktu ∆t.\n\nl_1=v_1 ∆t\nl_2=v_2 ∆t\nJumlah elemen massa yang mengalir dalam selang waktu ∆t pada penampang A1 dan A2 masing-masing adalah sebagai berikut:\n∆m_1=ρ_1 V_1=ρ_1 A_1 l_1=ρ_1 A_1 v_1 ∆t\n∆m_2=ρ_2 V_2=ρ_2 A_2 l_2=ρ_2 A_2 v_2 ∆t\nKarena yang mengalir adalah fluida ideal, maka tidak ada fluida yang keluar melalui dinding pipa. Sehingga jumlah elemen massa uang melewati penampang besar dan penampang kecil per satuan waktu akan sama. Secara matematis dapat ditulis sebagai berikut:\n∆m_1=∆m_2\nρ_1 A_1 v_1 ∆t=ρ_2 A_2 v_2 ∆t\nPersamaan tersebut merupakan persamaan kontinuitas untuk aliran massa fluida (kekekalan massa dalam aliran fluida). Fluida juga bersifat kompresibel yang berarti massa jenis fluidanya tetap (ρ_1=ρ_2), sehingga berlaku persamaan berikut:\nA_1 v_1=A_2 v_2   "atau"  Av=konstan\nDari persamaan tersebut dapat diketahui bahwa fluida tidak kompresibel hasil kali antara kecepatan aliran (v) dan luas penampang (A) selalui mempunyai nilai yang tetap. Semakin kecil luas penmpang pipa, maka semakin besar laju fluida. Hal ini disebabkan pada penampang kecil rapat garis arusnya semakin besar.',
  ),
  SubBab(
    judul: 'Sub Bab 3: Persamaan Bernoulli',
    isi:
        'Persamaan Bernoulli dapat diturunkan dari teorema Usaha dan Energi Newton yang menyatakan bahwa “Usaha yang dilakukan oleh resultan gaya pada sebuah sistem adalah sama dengan perubahan energi kinetik dari sistem tersebut”.\n\nAsas Bernoulli membahas tentang pengaruh kecepatan (v), ketinggian (h), dan tekanan fluida (P). Untuk menurunkan persamaan Bernoulli, asumsikan fluida dialirkan dalam pipa dengan luas penampang yang tidak sama antara ujung-ujung pipanya, ketinggian ujung-ujung pipa berubah terhadap titik acuannya seperti gambar 7. Apabila pipa dialiri fluida dari penampang besar A1 dengan ketinggian h1 ke penampang A2 dengan ketinggian h2, berdasarkan persamaan kontinuitas aliran fluida, kelajuan fluida pada penampang A2 lebih besar dibandingkan dengan aliran fluida pada penampang A1.\n\nGambar 7. Pipa dengan luas dan ketinggian yang berbeda antara ujung-ujungnya\nFluida dapat mengalir dari A1 ke A2 karena adanya faktor-faktor berikut:\nPerbedaan tekanan antara penampang A1 dengan penampang A2 menghasilkan usaha sebesar:\nW_12=F∆s\nW_12=P_1 A_1 l_1-P_2 A_2 l_2\nW_12=P_1 V_1-P_2 V_2\nKarena V_1=V_2=V, maka persamaan tersebut dapat ditulis sebagai berikut:\nW_12=(P_1-P_2)V\nPerbedaan kecepatan aliran dan perbedaan tinggi menghasilkan usaha sebesar:\nW_12=∆EK+∆EP\nW_12=(1/2 m〖v_2〗^2-1/2 m〖v_1〗^2 )+(mgh_2-mgh_1 )\nm=ρV\nW_12=((1/2 ρV) 〖v_2〗^2-(1/2 ρV) 〖v_1〗^2 )+(ρgh_2-ρgh_1 )\nW_12=1/2 ρV(〖v_2〗^2-〖v_1〗^2 )+ρg(h_2-h_1 )\nKedua persamaan tersebut sama. Karena itu, kita mendapatkan persamaan Bernoulli sebagai berikut:\nP_1+1/2 ρv_1^2 +ρgh_1 =P_2+1/2 ρv_2^2 +ρgh_2\nDengan kata lain, jumlah tekanan, energi kinetik, dan energi potensial pada titik A1 sama dengan jumlahnya pada titik A2.',
  ),
  SubBab(
    judul: 'Sub Bab 4: Penerapan Persamaan Kontinuitas dan Bernoulli',
    isi:
        'Persamaan kontinuitas dan persamaan Bernoulli memiliki banyak penerapan dalam kehidupan sehari-hari dan dalam berbagai industri. Beberapa contoh penerapan dari kedua persamaan ini antara lain:\nPenerapan dalam industri perpipaan untuk menghitung laju aliran fluida dalam pipa dengan diameter yang berbeda.\nPenerapan dalam desain sayap pesawat terbang untuk mengoptimalkan performa pesawat dan mengurangi hambatan udara.\nPenerapan dalam perancangan sistem saluran air untuk mengatasi masalah distribusi air bersih.\nPenerapan dalam dunia medis untuk mengukur tekanan darah dalam pembuluh darah.\nSelain itu, pemahaman tentang persamaan kontinuitas dan persamaan Bernoulli juga penting dalam memahami konsep aliran fluida dalam berbagai situasi, termasuk aliran dalam sungai, aliran dalam pipa, dan aliran di sekitar benda yang bergerak.',
  ),
];

List<Map<String, dynamic>> subBabListJson =
    subBabList.map((subBab) => subBab.toJson()).toList();
