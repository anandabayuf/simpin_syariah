import 'package:project_simpin_syariah/models/investasi/Investasi.dart';

class PengembalianNisbah{
  late int id;
  late Investasi investasi;
  late DateTime tanggalJatuhTempo;
  late String statusNisbah;

  PengembalianNisbah(this.id, this.investasi, this.tanggalJatuhTempo, this.statusNisbah);

  List<PengembalianNisbah> getDataPengembalianNisbah(String id){
    return [
      new PengembalianNisbah(0, this.investasi.getDataInvestasiById(id), DateTime.now(), "Terbayar"),
      new PengembalianNisbah(1, this.investasi.getDataInvestasiById(id), DateTime.now(), "Belum Bayar"),
      new PengembalianNisbah(2, this.investasi.getDataInvestasiById(id), DateTime.now(), "Terbayar"),
    ];
  }
}