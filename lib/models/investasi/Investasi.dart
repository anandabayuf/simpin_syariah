class Investasi{
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

  Investasi(
    this.namaAnggota, this.jenisInvestasi, this.produk, this.journal, this.analyticAccount,
    this.ahliWaris, this.paketInvestasi, this.quantity, this.totalInvestasi,
    this.jangkaWaktu, this.tanggalMulai, this.tanggalAkhir, this.pengembalian,
    this.nisbahInvestor, this.equivalentRate, this.pajak
  );

  Investasi.emptyConstructor();

  List<Investasi> getDataInvestasi(){
    return [
      new Investasi("", "Deposito", "", "", "", "", "", "", 0,
          "5 Tahun", DateTime.now(), DateTime.now(), "", 0, 0, 0),
      new Investasi("", "Emas", "", "", "", "", "", "", 0,
          "1 Tahun", DateTime.now(), DateTime.now(), "", 0, 0, 0),
      new Investasi("", "Saham", "", "", "", "", "", "", 0,
          "2 Tahun", DateTime.now(), DateTime.now(), "", 0, 0, 0),
      new Investasi("", "Obligasi", "", "", "", "", "", "", 0,
          "3 Tahun", DateTime.now(), DateTime.now(), "", 0, 0, 0),
      new Investasi("", "Properti", "", "", "", "", "", "", 0,
          "4 Tahun", DateTime.now(), DateTime.now(), "", 0, 0, 0),
    ];
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