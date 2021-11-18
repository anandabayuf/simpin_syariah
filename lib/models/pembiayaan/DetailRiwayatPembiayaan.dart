import 'package:project_simpin_syariah/models/pembiayaan/RiwayatPembiayaan.dart';

class DetailRiwayatPembiayaan{
  late int id;
  late RiwayatPembiayaan riwayatPembiayaan;
  late DateTime tanggalJatuhTempo;
  late int bayarCicilan;
  late int sisaCicilan;

  DetailRiwayatPembiayaan(int id, RiwayatPembiayaan riwayatPembiayaan,
      DateTime tanggalJatuhTempo, int bayarCicilan,
      int sisaCicilan){
    this.id = id;
    this.riwayatPembiayaan = riwayatPembiayaan;
    this.tanggalJatuhTempo = tanggalJatuhTempo;
    this.bayarCicilan = bayarCicilan;
    this.sisaCicilan = sisaCicilan;
  }

  List<DetailRiwayatPembiayaan> getDataDetailRiwayatPembiayaan(int idRiwayatPembiayaan){
    return [
      new DetailRiwayatPembiayaan(0, this.riwayatPembiayaan.getRiwayatPembiayaan(idRiwayatPembiayaan), DateTime.utc(2021, DateTime.march, 16), 1000000, 12),
      new DetailRiwayatPembiayaan(1, this.riwayatPembiayaan.getRiwayatPembiayaan(idRiwayatPembiayaan), DateTime.utc(2021, DateTime.april, 16), 1000000, 11),
      new DetailRiwayatPembiayaan(2, this.riwayatPembiayaan.getRiwayatPembiayaan(idRiwayatPembiayaan), DateTime.utc(2021, DateTime.may, 16), 1000000, 10),
      new DetailRiwayatPembiayaan(3, this.riwayatPembiayaan.getRiwayatPembiayaan(idRiwayatPembiayaan), DateTime.utc(2021, DateTime.june, 16), 1000000, 9),
      new DetailRiwayatPembiayaan(4, this.riwayatPembiayaan.getRiwayatPembiayaan(idRiwayatPembiayaan), DateTime.utc(2021, DateTime.july, 16), 1000000, 8),
      new DetailRiwayatPembiayaan(5, this.riwayatPembiayaan.getRiwayatPembiayaan(idRiwayatPembiayaan), DateTime.utc(2021, DateTime.august, 16), 1000000, 7),
      new DetailRiwayatPembiayaan(6, this.riwayatPembiayaan.getRiwayatPembiayaan(idRiwayatPembiayaan), DateTime.utc(2021, DateTime.september, 16), 1000000, 6),
      new DetailRiwayatPembiayaan(7, this.riwayatPembiayaan.getRiwayatPembiayaan(idRiwayatPembiayaan), DateTime.utc(2021, DateTime.october, 16), 1000000, 5),
      new DetailRiwayatPembiayaan(8, this.riwayatPembiayaan.getRiwayatPembiayaan(idRiwayatPembiayaan), DateTime.utc(2021, DateTime.november, 16), 1000000, 4),
      new DetailRiwayatPembiayaan(9, this.riwayatPembiayaan.getRiwayatPembiayaan(idRiwayatPembiayaan), DateTime.utc(2021, DateTime.december, 16), 1000000, 3),
      new DetailRiwayatPembiayaan(10, this.riwayatPembiayaan.getRiwayatPembiayaan(idRiwayatPembiayaan), DateTime.utc(2022, DateTime.january, 16), 1000000, 2),
      new DetailRiwayatPembiayaan(11, this.riwayatPembiayaan.getRiwayatPembiayaan(idRiwayatPembiayaan), DateTime.utc(2022, DateTime.february, 16), 1000000, 1),
    ];
  }
}