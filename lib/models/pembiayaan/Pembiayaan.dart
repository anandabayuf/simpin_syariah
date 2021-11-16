class Pembiayaan {
  late String peruntukkan1;
  late String peruntukkan2;
  late String jenisAkad;
  late String pemindahanHak;
  late String vendor;
  late String rekPihakKetiga;
  late String analyticAcc;

  late DateTime tanggalAkad;
  late int nilaiPPA; //nilai pembiayaan periode angsuran
  late int hargaJual;
  late int angsuran;
  late int tHPGajiTerakhir;
  late int cashRatio;

  late String ktpFile;
  late String ktpPasanganFile;
  late String kartuKeluargaFile;
  late String slipGaji1File;
  late String slipGaji2File;
  late String slipGaji3File;

  Pembiayaan(
    this.peruntukkan1, this.peruntukkan2, this.jenisAkad, this.pemindahanHak,
    this.vendor, this.rekPihakKetiga, this.analyticAcc, this.tanggalAkad,
    this.nilaiPPA, this.hargaJual, this.angsuran, this.tHPGajiTerakhir,
    this.cashRatio, this.ktpFile, this.ktpPasanganFile, this.kartuKeluargaFile,
    this.slipGaji1File, this.slipGaji2File, this.slipGaji3File
  );

  Pembiayaan.emptyConstructor();

  List<String> getDataPeruntukkan(){
    return[
      'Peruntukkan - 1',
      'Peruntukkan - 2',
      'Peruntukkan - 3',
    ];
  }

  List<String> getDataJenisAkad(){
    return[
      'Jenis Akad - 1',
      'Jenis Akad - 2',
      'Jenis Akad - 3',
    ];
  }

  List<String> getDataPemindahanHak(){
    return[
      'Pemindahan Hak - 1',
      'Pemindahan Hak - 2',
      'Pemindahan Hak - 3',
    ];
  }

  List<String> getDataVendor(){
    return[
      'Vendor - 1',
      'Vendor - 2',
      'Vendor - 3',
    ];
  }

  List<String> getDataRekPihakKetiga(){
    return[
      'Rekening Pihak Ketiga - 1',
      'Rekening Pihak Ketiga - 2',
      'Rekening Pihak Ketiga - 3',
    ];
  }

  List<String> getDataAnalyticAccount(){
    return[
      'Analytic Account - 1',
      'Analytic Account - 2',
      'Analytic Account - 3',
    ];
  }
}