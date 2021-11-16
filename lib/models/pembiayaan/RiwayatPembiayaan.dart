class RiwayatPembiayaan{
  late int id;
  late int nilaiPembiayaan;
  late String tujuanPembiayaan;
  late String jenisAkad;
  late String statusPembiayaan;

  RiwayatPembiayaan(int id, int nilaiPembiayaan, String tujuanPembiayaan,
      String jenisAkad, String statusPembiayaan){
    this.id = id;
    this.nilaiPembiayaan = nilaiPembiayaan;
    this.tujuanPembiayaan = tujuanPembiayaan;
    this.jenisAkad = jenisAkad;
    this.statusPembiayaan = statusPembiayaan;
  }

  List<RiwayatPembiayaan> getDataRiwayatPembiayaan(){
    return [
      new RiwayatPembiayaan(0, 200000000, "Peruntukkan XXX", "Mudharabah", "Lunas"),
      new RiwayatPembiayaan(1, 100000000, "Peruntukkan XXX", "Mudharabah", "Belum Lunas"),
      new RiwayatPembiayaan(2, 300000000, "Peruntukkan XXX", "Mudharabah", "Belum Lunas"),
      new RiwayatPembiayaan(3, 500000000, "Peruntukkan XXX", "Mudharabah", "Lunas"),
      new RiwayatPembiayaan(4, 800000000, "Peruntukkan XXX", "Mudharabah", "Belum Lunas"),
    ];
  }
}