import 'package:project_simpin_syariah/models/pembiayaan/RiwayatPembiayaan.dart';

class DetailAngsuran{
  late int id;
  late RiwayatPembiayaan riwayatPembiayaan;
  late DateTime tanggalJatuhTempo;
  late int bayarCicilan;
  late int sisaCicilan;
  late String status;

  DetailAngsuran(int id, RiwayatPembiayaan riwayatPembiayaan,
      DateTime tanggalJatuhTempo, int bayarCicilan,
      int sisaCicilan, String status){
    this.id = id;
    this.riwayatPembiayaan = riwayatPembiayaan;
    this.tanggalJatuhTempo = tanggalJatuhTempo;
    this.bayarCicilan = bayarCicilan;
    this.sisaCicilan = sisaCicilan;
    this.status = status;
  }

  List<DetailAngsuran> getDataDetailRiwayatPembiayaan(String idRiwayatPembiayaan){
    return [
      new DetailAngsuran(0, this.riwayatPembiayaan.getRiwayatPembiayaan(idRiwayatPembiayaan), DateTime.utc(2021, DateTime.march, 16), 1000000, 12, "Terbayar"),
      new DetailAngsuran(1, this.riwayatPembiayaan.getRiwayatPembiayaan(idRiwayatPembiayaan), DateTime.utc(2021, DateTime.april, 16), 1000000, 11, "Terbayar"),
      new DetailAngsuran(2, this.riwayatPembiayaan.getRiwayatPembiayaan(idRiwayatPembiayaan), DateTime.utc(2021, DateTime.may, 16), 1000000, 10, "Belum Bayar"),
      new DetailAngsuran(3, this.riwayatPembiayaan.getRiwayatPembiayaan(idRiwayatPembiayaan), DateTime.utc(2021, DateTime.june, 16), 1000000, 9, "Belum Bayar"),
      new DetailAngsuran(4, this.riwayatPembiayaan.getRiwayatPembiayaan(idRiwayatPembiayaan), DateTime.utc(2021, DateTime.july, 16), 1000000, 8, "Belum Bayar"),
      new DetailAngsuran(5, this.riwayatPembiayaan.getRiwayatPembiayaan(idRiwayatPembiayaan), DateTime.utc(2021, DateTime.august, 16), 1000000, 7, "Belum Bayar"),
      new DetailAngsuran(6, this.riwayatPembiayaan.getRiwayatPembiayaan(idRiwayatPembiayaan), DateTime.utc(2021, DateTime.september, 16), 1000000, 6, "Belum Bayar"),
      new DetailAngsuran(7, this.riwayatPembiayaan.getRiwayatPembiayaan(idRiwayatPembiayaan), DateTime.utc(2021, DateTime.october, 16), 1000000, 5, "Belum Bayar"),
      new DetailAngsuran(8, this.riwayatPembiayaan.getRiwayatPembiayaan(idRiwayatPembiayaan), DateTime.utc(2021, DateTime.november, 16), 1000000, 4, "Belum Bayar"),
      new DetailAngsuran(9, this.riwayatPembiayaan.getRiwayatPembiayaan(idRiwayatPembiayaan), DateTime.utc(2021, DateTime.december, 16), 1000000, 3, "Belum Bayar"),
      new DetailAngsuran(10, this.riwayatPembiayaan.getRiwayatPembiayaan(idRiwayatPembiayaan), DateTime.utc(2022, DateTime.january, 16), 1000000, 2, "Belum Bayar"),
      new DetailAngsuran(11, this.riwayatPembiayaan.getRiwayatPembiayaan(idRiwayatPembiayaan), DateTime.utc(2022, DateTime.february, 16), 1000000, 1, "Belum Bayar"),
    ];
  }
}