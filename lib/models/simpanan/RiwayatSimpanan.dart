class RiwayatSimpanan{
  late String id;
  late String jenisSimpanan;
  late int saldo;

  RiwayatSimpanan(this.id, this.jenisSimpanan, this.saldo);

  RiwayatSimpanan.emptyConstructor();

  List<String> getDataJenisSimpanan(){
    return [
      "Jenis Simpanan - 1",
      "Jenis Simpanan - 2",
      "Jenis Simpanan - 3"
    ];
  }

  List<RiwayatSimpanan> getRiwayatSimpanan(){
    return[
      new RiwayatSimpanan("123ABC", "Jenis Simpanan - 1", 1000000),
      new RiwayatSimpanan("890XYZ", "Jenis Simpanan - 2", 5000000),
      new RiwayatSimpanan("348JJE", "Jenis Simpanan - 3", 3000000),
    ];
  }

  List<RiwayatSimpanan> getEmptyRiwayatSimpanan(){
    return[
    ];
  }

  RiwayatSimpanan getRiwayatSimpananById(String idRiwayatSimpanan){
    return this.getRiwayatSimpanan().where((element) => element.id == idRiwayatSimpanan).first;
  }
}