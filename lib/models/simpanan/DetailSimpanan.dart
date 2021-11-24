import 'package:project_simpin_syariah/models/simpanan/RiwayatSimpanan.dart';

class DetailSimpanan{
  late String id;
  late RiwayatSimpanan riwayatSimpanan;
  late int nominalSimpanan;
  late DateTime tanggalSimpanan;
  late String status;

  DetailSimpanan(this.id, this.riwayatSimpanan, this.nominalSimpanan,
      this.tanggalSimpanan, this.status);

  DetailSimpanan.emptyConstructor();

  List<DetailSimpanan> getDetailSimpanan(String idRiwayatSimpanan){
    return [
      new DetailSimpanan("", riwayatSimpanan.getRiwayatSimpananById(idRiwayatSimpanan),
          5000000, DateTime.now(), "Status")
    ];
  }
}