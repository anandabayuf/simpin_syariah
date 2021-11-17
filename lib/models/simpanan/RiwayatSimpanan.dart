import 'package:project_simpin_syariah/models/simpanan/Simpanan.dart';

class RiwayatSimpanan{
  int id;
  Simpanan simpanan;

  RiwayatSimpanan(this.id, this.simpanan);

  List<RiwayatSimpanan> getRiwayatSimpanan(){
    return[
      new RiwayatSimpanan(0, new Simpanan("Jenis Simpanan - 1", 1000000)),
      new RiwayatSimpanan(1, new Simpanan("Jenis Simpanan - 2", 5000000)),
      new RiwayatSimpanan(2, new Simpanan("Jenis Simpanan - 3", 3000000)),
      new RiwayatSimpanan(3, new Simpanan("Jenis Simpanan - 1", 2000000)),
      new RiwayatSimpanan(4, new Simpanan("Jenis Simpanan - 2", 10000000))
    ];
  }

  List<RiwayatSimpanan> getEmptyRiwayatSimpanan(){
    return[
    ];
  }
}