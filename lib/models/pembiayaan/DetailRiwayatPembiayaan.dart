class DetailRiwayatPembiayaan{
  late int id;
  late int nilaiPembiayaan;
  late String tujuanPembiayaan;
  late String jenisAkad;
  late String statusPembiayaan;
  late DateTime tanggalPembayaran;
  late int bayarCicilan;
  late int sisaCicilan;

  DetailRiwayatPembiayaan(int id, int nilaiPembiayaan, String tujuanPembiayaan,
      String jenisAkad, String statusPembiayaan, DateTime tanggalPembayaran,
      int bayarCicilan, int sisaCicilan){
    this.id = id;
    this.nilaiPembiayaan = nilaiPembiayaan;
    this.tujuanPembiayaan = tujuanPembiayaan;
    this.jenisAkad = jenisAkad;
    this.statusPembiayaan = statusPembiayaan;
    this.tanggalPembayaran = tanggalPembayaran;
    this.bayarCicilan = bayarCicilan;
    this.sisaCicilan = sisaCicilan;
  }

  List<DetailRiwayatPembiayaan> getDataDetailRiwayatPembiayaan(){
    return [
      new DetailRiwayatPembiayaan(0, 200000000, "Peruntukkan XXX", "Mudharabah", "Lunas", DateTime.utc(2021, DateTime.march, 16), 1000000, 12),
      new DetailRiwayatPembiayaan(1, 200000000, "Peruntukkan XXX", "Mudharabah", "Belum Lunas", DateTime.utc(2021, DateTime.march, 16), 1000000, 12),
      new DetailRiwayatPembiayaan(2, 200000000, "Peruntukkan XXX", "Mudharabah", "Belum Lunas", DateTime.utc(2021, DateTime.march, 16), 1000000, 12),
      new DetailRiwayatPembiayaan(3, 200000000, "Peruntukkan XXX", "Mudharabah", "Belum Lunas", DateTime.utc(2021, DateTime.march, 16), 1000000, 12),
      new DetailRiwayatPembiayaan(4, 200000000, "Peruntukkan XXX", "Mudharabah", "Belum Lunas", DateTime.utc(2021, DateTime.march, 16), 1000000, 12),
      new DetailRiwayatPembiayaan(5, 200000000, "Peruntukkan XXX", "Mudharabah", "Belum Lunas", DateTime.utc(2021, DateTime.march, 16), 1000000, 12),
      new DetailRiwayatPembiayaan(6, 200000000, "Peruntukkan XXX", "Mudharabah", "Belum Lunas", DateTime.utc(2021, DateTime.march, 16), 1000000, 12),
      new DetailRiwayatPembiayaan(7, 200000000, "Peruntukkan XXX", "Mudharabah", "Belum Lunas", DateTime.utc(2021, DateTime.march, 16), 1000000, 12),
      new DetailRiwayatPembiayaan(8, 200000000, "Peruntukkan XXX", "Mudharabah", "Belum Lunas", DateTime.utc(2021, DateTime.march, 16), 1000000, 12),
      new DetailRiwayatPembiayaan(9, 200000000, "Peruntukkan XXX", "Mudharabah", "Belum Lunas", DateTime.utc(2021, DateTime.march, 16), 1000000, 12),
      new DetailRiwayatPembiayaan(10, 200000000, "Peruntukkan XXX", "Mudharabah", "Belum Lunas", DateTime.utc(2021, DateTime.march, 16), 1000000, 12),
      new DetailRiwayatPembiayaan(11, 200000000, "Peruntukkan XXX", "Mudharabah", "Belum Lunas", DateTime.utc(2021, DateTime.march, 16), 1000000, 12),
    ];
  }
}