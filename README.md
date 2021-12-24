# Repository Simpin Syariah

## Daftar Isi
- [Ulasan Project](#ulasan-project)
    - [Deskripsi Project](#deskripsi-project)
    - [*Tools* dan Teknologi yang digunakan](#*tools*-dan-teknologi-yang-digunakan)
    - [Task yang sudah dan belum dikerjakan](#Task-yang-sudah-dan-belum-dikerjakan)
    - [Struktur Project](#struktur-project)
    - [Library yang digunakan](#Library-yang-digunakan)
- Prasyarat
- Pengembangan

## Ulasan Project

### Deskripsi Project
Repository ini berisi *source code* *project app* Flutter dari pengembangan *front-end* aplikasi Simpin Syariah. 

Aplikasi Simpin Syariah merupakan aplikasi berbasis *mobile* Android. Pengembangan *front-end* aplikasi yang dilakukan yaitu mengimplementasi *design mockup* setiap *screen* yang terdapat pada aplikasi atau dalam kata lain yaitu *slicing* atau *layouting*. 

*Design Mockup* setiap tampilan yang sudah dirancang dapat dilihat pada [tautan](https://drive.google.com/drive/folders/1T_D8vSawmMxNkbdl6JqKKb2pf2kyIS-d?usp=sharing).

### *Tools* dan Teknologi yang digunakan
*Front-end* dikembangkan dengan *framework* [Flutter](https://flutter.dev/) dengan bahasa pemrograman [Dart](https://dart.dev/) dan menggunakan IDE [Android Studio](https://developer.android.com/studio).

### Task yang sudah dan belum dikerjakan
*Front-end* yang sudah dikembangkan diantaranya yaitu:
- [x] Tampilan Login beserta fungsionalnya
- [x] Tampilan Lupa Password beserta fungsionalnya
- Tampilan Pembiayaan
    - [x] Tampilan Riwayat Pembiayaan & Filter beserta fungsionalnya
    - [x] Tampilan Detail Angsuran beserta fungsionalnya
    - [x] TampilanPengajuan Pembiayaan beserta fungsionalnya
- Tampilan Simpanan
    - [x] Tampilan Riwayat Simpanand & Filter beserta fungsionalnya
    - [x] Tampilan Detail Simpanan beserta fungsionalnya
- Tampilan Investasi
    - [x] Tampilan Riwayat Investasi & Filter beserta fungsionalnya
    - [x] Tampilan Pengembalian Nisbah beserta fungsionalnya
    - [x] Tampilan Pengajuan Investasi beserta fungsionalnya
- Tampilan Keanggotaan
    - [x] Tampilan ubah data keanggotaan beserta fungsionalnya 
    - [x] Tampilan ubah password beserta fungsionalnya
- [ ] Fungsi setiap fitur
- [ ] Integrasi dengan *backend* API


### Struktur Project
*Project* ini merupakan Flutter *project app*. Adapun *source code front-end* yang dikembangkan disimpan pada *folder* **lib**. Pada *folder* tersebut terdapat *folder* **models** dan **views** serta *file* **main.dart**.

#### main.dart
*File* ini merupakan main *file* dari *project* ini. *Project* di-*run* melalui *file* ini. *File* ini dapat dikatakan lapisan terluar yang berisi komponen-komponen di dalamnya.

#### models
*Folder* ini berisikan *class object* representasi *domain*. Contoh **Investasi.dart**, **Notifikasi.dart**, dll yang di-*wrap* oleh suatu *folder* *domain* itu sendiri.
Struktur dari **models** ini yaitu:


    ->models
        -> investasi
            -> Investasi.dart
            -> PengembalianNisbah.dart
        -> pembiayaan
            -> DetailAngsuran.dart
            -> Pembiayaan.dart
            -> RiwayatPembiayaan.dart


#### views
*Folder* ini berisikan *screen-screen* setiap fiturnya. Setiap folder di dalamnya merupakan representasi dari setiap fitur. Dan setiap *folder* fitur memiliki folder **screens** dan **widgets**. **screens** merupakan komponen *screen* yang berisi kumpulan *widget* dari *folder* **widgets** yang disusun sehingga membentuk satu *screen*. **widgets** berisi komponen *widgets* yang dapat digunakan ulang (*reusable*). Di dalamnya juga terdapat *folder* **customwidgets** yang berisi *widget-widget* yang dibuat disesuaikan dengan rancangan serta dapat digunakan ulang (*reusable*). 
Pada **views** juga terdapat **Main.dart** yang merupakan *file* yang menampung *screen* awal setelah pengguna *login*. Berisikan komponen *bottom navigation bar*.
Struktur dari **views** ini yaitu:


    ->views
        -> forgetpassword
            -> screens
                -> InputEmailScreen.dart
                -> EmailVerificationScreen.dart
            -> widgets
                -> FormInputEmail.dart
                -> FormCodeVerification.dart
        -> pembiayaan
            -> screens
                -> RiwayatPembiayaanScreen.dart
                -> AjukanPembiayaanScreen1.dart
            -> widgets
                -> FormPembaiayan1.dart
                -> ContainerRiayatPembiayaan.dart


### Library yang digunakan
Terdapat banyak sekali *library* yang digunakan dalam pengembangan *front-end* ini. Semua *library* diambil dari [The official package repository for Dart and Flutter apps.](https://pub.dev/). *Library* yang digunakan dapat dilihat pada *file* **pubspec.yaml** dan untuk menambahkan *dependency* dapat ditambahkan *file* tersebut pada bagian

```yaml
dependencies:
    #tambahkan dependency disini
```

## Prasyarat
Sebelum dapat menggunakan project ini, diharuskan untuk:
1. Install [Flutter SDK](https://docs.flutter.dev/get-started/install) (disarankan menggunakan versi *stable* [2.5.3](https://docs.flutter.dev/development/tools/sdk/releases))