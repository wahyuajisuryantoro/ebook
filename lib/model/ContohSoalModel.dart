class ContohSoal {
  final String subBab;
  final String isi;
  final String penyelesaian;

  ContohSoal({
    required this.subBab,
    required this.isi,
    required this.penyelesaian,
  });

  Map<String, dynamic> toJson() {
    return {
      'subBab': subBab,
      'isi': isi,
      'penyelesaian': penyelesaian,
    };
  }
}

List<ContohSoal> contohSoal = [
  ContohSoal(
    subBab: 'SUBBAB 1 FLUIDA IDEAL',
    isi:
        '1.	Fluida ideal adalah fluida: 1.kompresibel 2.tidak kompresibel 3.viskos 4.tidak kental 5.turbulen.Pernyataan yang benar mengenai sifat-sifat fluida ideal adalah',
    penyelesaian:
        'Fluida ideal memiliki sifat-sifat sebagai berikut: a. Aliran tunak (permanent flow) yaitu komponen alirannya tidak berubah terhadap waktu b. Tidak termampatkan (incompressible), yaitu fluida yang mengalir tidak mengalami perubahan volume atau massa jenis ketika ditekan c. Aliran yang tidak kental (non viscous) d. Laminar, yaitu aliran memiliki garis arus dan tidak bergolak, artinya tiap partikel fluida akan melewati titik lintasan yang sama dengan arah yang sama.Turbulen adalah kebalikan dari laminar, yaitu memiliki aliran yang bergolak.Jadi, pernyataan yang benar adalah (2) tidak kompresibel dan (4) tidak kental',
  ),
  ContohSoal(
    subBab: 'SUBBAB 2 PERSAMAAN KONTINUITAS',
    isi:
        'Silinder lurus dengan luas penampang besar dan kecil berturut-turut 20 cm2 dan 5 cm2 diletakkan mendatar. Jika kelajuan air pada penampang besar adalah 3 m/s, kelajuan air pada penampang kecil adalah . . .',
    penyelesaian:
        'Diketahui: A1 = 20 cm2 = 20 x 10-4 m A2 = 5 cm2 = 5 x 10-4 m v1 = 3 m/s Ditanya: v2 = ? Jawab: Debit aliran fluida Q=A_1 v_1 Q=(20×10^(-4) )(3) Q=60×10^(-4)=6×10^(-3) m^3/s Laju aliran fluida pada penampang kecil A_1 v_1=A_2 v_2 v_2=(A_1 v_1)/A_2  v_2=(20)(3)/5 v_2=12 m/s',
  ),
  ContohSoal(
      subBab: 'SUBAB 3 ASAS BERNOULI',
      isi:
          'Air mengalir ke atas melalui pipa. Penampang 2 berada diketinggian 1,2 m dan luas penampang A2 20 cm2. Jika kelajuan air pada A1 adalah 6 m/s dan debit air 16 liter/s, perbedaan tekanan antara kedua ujung pipa sehingga air dapat mengalir ke atas adalah . . . (ρ air = 1 g/cm3)',
      penyelesaian:
          'Penyelesaian: Diketahui: A2 = 20 cm2 = 2 x 10-3 m2 h2 = 1,2 mv1 = 6 m/s Q = 16 liter/s = 16 x 10-3 m3/s ρ air = 1 g/cm3 Ditanya: P1 - P2 = ? Jawab: Q=A_2 v_2 16×10^(-3)=(2×10^(-3) )(v_2 ) v_2=8 m/s P_1-P_2=1/2 ρ〖v_2〗^2-1/2 ρ〖v_1〗^2+ρgh_2-ρgh_1 P_1-P_2=1/2(1000)(〖8)〗^2-1/2(1000)(〖6)〗^2+(1000)(10)(1,2)-(1000)(10)(0)P_1-P_2=32000-18000+12000-0 P_1-P_2=26000 Pa'),
  ContohSoal(
      subBab: 'SUBBAB 4 PENERAPAN PERSAMAAN KONTINUITAS DAN BERNOULLI',
      isi:
          'Bejana berbentuk silinder diisi penuh dengan air setinggi 2 m. Pada ketinggian 20 cm dari dasar bejana terdapat lubang kebocoran kecil. Jika g = 10 m/s2, tentukan: a.	Kecepatan air yang keluar lubang b.	Jarak jatuh air dalam arah mendatar c.	Volume air yang mengalir selama 1 menit jika luas lubang 5 cm2',
      penyelesaian:
          'Diketahui: h1 = 2 m h2 = 20 cm h = 1,8 m g = 10 m/s2 t = 60 sekon A = 5 cm2 = 5 x 10-4 m2 Ditanya: a. v2 = ? b. x = ? c. V = ? Jawab: a. Kecepatan air yang keluar lubang (v2) v_2=√2gh v_2=√(2(10)(1,8) ) v_2=6 m/s b. Jarak jatuh air dalam arah mendatar (x) x=2√((h_1-h_2)h_2 ) x=2√((2-0,2)(0,2))x=2√((1,8)(0,2)) x=2√0,36=2(0,6)  x=1,2 m c. Volume air dengan t = 60 sekon dan A = 5 x 10-4 m2 Q=Av V/t=Av V=Avt V=5×10^(-4)×6×60 V=0,18 m^3=180 liter')
];

List<Map<String, dynamic>> contohSoalListJson =
    contohSoal.map((subBab) => subBab.toJson()).toList();
