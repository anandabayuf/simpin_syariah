class Notifikasi{
  late int id;
  late String kategori;
  late String detail;
  late DateTime waktu;
  late bool read;

  Notifikasi(this.id, this.kategori, this.detail, this.waktu, this.read);

  Notifikasi.emptyConstructor();

  List<Notifikasi> getDataNotifikasi(){
    return [
      new Notifikasi(0, "Pembiayaan", "Cicilan pembiayaan x jatuh tempo pada "
          "tanggal 23 November 2021", DateTime(2021, DateTime.november, 20, 19, 20), false),
      new Notifikasi(0, "Simpanan", "Simpanan wajib bulan Januari jatuh tempo "
          "bulan Desember", DateTime(2021, DateTime.november, 19, 7, 30), false),
      new Notifikasi(0, "Pembiayaan", "Cicilan pembiayaan x jatuh tempo pada "
          "tanggal 23 Oktober 2021", DateTime(2021, DateTime.october, 20, 19, 20), true),
    ];
  }
}