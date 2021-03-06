import 'package:image_picker/image_picker.dart';

class Investasi{
  late String id;
  late String namaAnggota;
  late String jenisInvestasi;
  late String produk;
  late String journal;
  late String analyticAccount;
  late String ahliWaris;
  late String paketInvestasi;
  late String quantity;

  late int totalInvestasi;
  late String jangkaWaktu;
  late DateTime tanggalMulai;
  late DateTime tanggalAkhir;
  late String pengembalian;
  late int nisbahInvestor;
  late double equivalentRate;
  late int pajak;

  late XFile ktpFile;
  late XFile ktpPasanganFile;
  late XFile kartuKeluargaFile;
  late XFile slipGaji1File;
  late XFile slipGaji2File;
  late XFile slipGaji3File;

  Investasi(
      this.id,
    this.namaAnggota, this.jenisInvestasi, this.produk, this.journal, this.analyticAccount,
    this.ahliWaris, this.paketInvestasi, this.quantity, this.totalInvestasi,
    this.jangkaWaktu, this.tanggalMulai, this.tanggalAkhir, this.pengembalian,
    this.nisbahInvestor, this.equivalentRate, this.pajak, this.ktpFile, this.ktpPasanganFile,
      this.kartuKeluargaFile, this.slipGaji1File, this.slipGaji2File, this.slipGaji3File
  );

  Investasi.emptyConstructor();

  List<Investasi> getDataInvestasi(){
    return [
      new Investasi("194JRN", "", "Deposito", "", "", "", "", "", "", 100000000,
          "5 Tahun", DateTime.now(), DateTime.now(), "Pengembalian - 1", 100000000, 0, 0,
      new XFile(""), new XFile(""), new XFile(""), new XFile(""), new XFile(""), new XFile("")),
      new Investasi("485FRJ", "", "Emas", "", "", "", "", "", "", 50000000,
          "1 Tahun", DateTime.now(), DateTime.now(), "Pengembalian - 2", 500000000, 0, 0,
          new XFile(""), new XFile(""), new XFile(""), new XFile(""), new XFile(""), new XFile("")),
      new Investasi("399KKE", "", "Saham", "", "", "", "", "", "", 100000000,
          "2 Tahun", DateTime.now(), DateTime.now(), "Pengembalian - 3", 400000000, 0, 0,
          new XFile(""), new XFile(""), new XFile(""), new XFile(""), new XFile(""), new XFile("")),
      new Investasi("453NRN", "", "Obligasi", "", "", "", "", "", "", 300000000,
          "3 Tahun", DateTime.now(), DateTime.now(), "Pengembalian - 1", 300000000, 0, 0,
          new XFile(""), new XFile(""), new XFile(""), new XFile(""), new XFile(""), new XFile("")),
      new Investasi("560NTR", "", "Properti", "", "", "", "", "", "", 1000000000,
          "4 Tahun", DateTime.now(), DateTime.now(), "Pengembalian - 2", 200000000, 0, 0,
          new XFile(""), new XFile(""), new XFile(""), new XFile(""), new XFile(""), new XFile("")),
    ];
  }

  Investasi getDataInvestasiById(String id){
    return this.getDataInvestasi().where((element) => element.id == id).first;
  }

  List<String> dataDropDownJenisInvestasi(){
    return[
      "Deposito",
      "Saham",
      "Obligasi",
      "Reksadana",
      "Emas",
      "Properti"
    ];
  }

  List<String> dataDropDownProduk(){
    return[
      "Produk - 1",
      "Produk - 2",
      "Produk - 3"
    ];
  }

  List<String> dataDropDownJournal(){
    return[
      "Journal - 1",
      "Journal - 2",
      "Journal - 3"
    ];
  }

  List<String> dataDropDownAnalyticAccount(){
    return[
      "Analytic Account - 1",
      "Analytic Account - 2",
      "Analytic Account - 3"
    ];
  }

  List<String> dataDropDownAhliWaris(){
    return[
      "Ahli Waris - 1",
      "Ahli Waris - 2",
      "Ahli Waris - 3"
    ];
  }

  List<String> dataDropDownPaketInvestasi(){
    return[
      "Paket Investasi - 1",
      "Paket Investasi - 2",
      "Paket Investasi - 3"
    ];
  }

  List<String> dataDropDownQuantity(){
    return[
      "Quantity - 1",
      "Quantity - 2",
      "Quantity - 3"
    ];
  }

  List<String> dataDropDownJangkaWaktu(){
    return[
      "1 Tahun",
      "2 Tahun",
      "3 Tahun",
      "4 Tahun",
      "5 Tahun"
    ];
  }

  List<String> dataDropDownPengembalian(){
    return[
      "Pengembalian - 1",
      "Pengembalian - 2",
      "Pengembalian - 3"
    ];
  }
}