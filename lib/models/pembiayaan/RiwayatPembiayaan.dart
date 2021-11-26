class RiwayatPembiayaan{
  late String id;
  late int nilaiPembiayaan;
  late String tujuanPembiayaan;
  late String jenisAkad;
  late String statusPembiayaan;

  RiwayatPembiayaan(String id, int nilaiPembiayaan, String tujuanPembiayaan,
      String jenisAkad, String statusPembiayaan){
    this.id = id;
    this.nilaiPembiayaan = nilaiPembiayaan;
    this.tujuanPembiayaan = tujuanPembiayaan;
    this.jenisAkad = jenisAkad;
    this.statusPembiayaan = statusPembiayaan;
  }

  List<RiwayatPembiayaan> getDataRiwayatPembiayaan(){
    return [
      new RiwayatPembiayaan("343DJJ", 200000000, "Peruntukkan - 1", "Jenis Akad - 1", "Lunas"),
      new RiwayatPembiayaan("242KEK", 100000000, "Peruntukkan - 2", "Jenis Akad - 2", "Aktif"),
      new RiwayatPembiayaan("495MRK", 300000000, "Peruntukkan - 3", "Jenis Akad - 3", "Aktif"),
      new RiwayatPembiayaan("958ENC", 500000000, "Peruntukkan - 1", "Jenis Akad - 2", "Lunas"),
      new RiwayatPembiayaan("395ERF", 800000000, "Peruntukkan - 2", "Jenis Akad - 1", "Aktif"),
    ];
  }

  RiwayatPembiayaan getRiwayatPembiayaan(String id){
    return this.getDataRiwayatPembiayaan().where((element) => element.id == id).first;
  }
}