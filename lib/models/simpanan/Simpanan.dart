class Simpanan {
  late String jenisSimpanan;
  late int nominalSimpanan;

  Simpanan(this.jenisSimpanan, this.nominalSimpanan);

  Simpanan.emptyConstructor();

  List<String> getDataJenisSimpanan(){
    return[
      'Jenis Simpanan - 1',
      'Jenis Simpanan - 2',
      'Jenis Simpanan - 3',
    ];
  }
}