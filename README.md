# Repository Simpin Syariah

## Daftar Isi
- [Ulasan *Project*](#ulasan-project)
    - [Deskripsi *Project*](#deskripsi-project)
    - [*Tools* dan Teknologi yang Digunakan](#*tools*-dan-teknologi-yang-digunakan)
    - [*Task* yang Sudah dan Belum Dikerjakan](#Task-yang-sudah-dan-belum-dikerjakan)
    - [Struktur *Project*](#struktur-project)
    - [*Library* yang Digunakan](#Library-yang-digunakan)
    - [*Assets* yang Digunakan](#assets-yang-digunakan)
- [Prasyarat](#prasyarat)
- [Cara Menjalankan *Project*](#cara-menjalankan-project)
- [Cara Melakukan *Deployment*](#cara-melakukan-deployment)

## Ulasan *Project*

### Deskripsi *Project*
Reposito*ry ini berisi *source code* *project app* Flutter dari pengembangan *front-end* aplikasi Simpin Syariah. 

Aplikasi Simpin Syariah merupakan aplikasi berbasis *mobile* Android. Pengembangan *front-end* aplikasi yang dilakukan yaitu mengimplementasi *design mockup* setiap *screen* yang terdapat pada aplikasi atau dalam kata lain yaitu *slicing* atau *layouting*. 

*Design Mockup* setiap tampilan yang sudah dirancang dapat dilihat pada [tautan](https://drive.google.com/drive/folders/1T_D8vSawmMxNkbdl6JqKKb2pf2kyIS-d?usp=sharing).

### *Tools* dan Teknologi yang Digunakan
*Front-end* dikembangkan dengan *framework* [Flutter](https://flutter.dev/) dengan bahasa pemrograman [Dart](https://dart.dev/) dan menggunakan IDE [Android Studio](https://developer.android.com/studio).

### *Task* yang sudah dan belum Dikerjakan
*Front-end* yang sudah dikembangkan diantaranya yaitu:
- [x] Tampilan login beserta fungsionalnya
- [x] Tampilan lupa Password beserta fungsionalnya
- [x] Tampilan home beserta fungsionalnya
- [x] Tampilan notifikasi beserta fungsionalnya
- [x] Tampilan versi aplikasi
- Tampilan Pembiayaan
    - [x] Tampilan riwayat pembiayaan & filter beserta fungsionalnya
    - [x] Tampilan detail Angsuran beserta fungsionalnya
    - [x] Tampilan pengajuan Pembiayaan beserta fungsionalnya
- Tampilan Simpanan
    - [x] Tampilan riwayat simpanan & filter beserta fungsionalnya
    - [x] Tampilan detail simpanan beserta fungsionalnya
- Tampilan Investasi
    - [x] Tampilan riwayat investasi & filter beserta fungsionalnya
    - [x] Tampilan pengembalian nisbah beserta fungsionalnya
    - [x] Tampilan pengajuan investasi beserta fungsionalnya
- Tampilan Keanggotaan
    - [x] Tampilan ubah data keanggotaan beserta fungsionalnya 
    - [x] Tampilan ubah password beserta fungsionalnya
- [ ] Fungsi setiap fitur
- [ ] Integrasi dengan *backend* API


### Struktur *Project*
*Project* ini merupakan Flutter *project app*. Adapun *source code front-end* yang dikembangkan disimpan pada *folder* [lib](lib/). Pada *folder* tersebut terdapat *folder* [models](lib/models) dan [views](lib/views/) serta *file* [main.dart](lib/main.dart/).

#### main.dart
*File* ini merupakan main *file* dari *project* ini. *Project* di-*run* melalui *file* ini. *File* ini dapat dikatakan lapisan terluar yang berisi komponen-komponen di dalamnya.

#### models
*Folder* ini berisikan *class object* representasi *domain*. Contoh [Investasi.dart](lib/models/investasi/Investasi.dart/), [Notifikasi.dart](lib/models/notifikasi/Notifikasi.dart/), dll yang di-*wrap* oleh suatu *folder domain* itu sendiri.
Struktur dari [models](lib/models) ini yaitu:


    ->models
        -> investasi
            -> Investasi.dart
            -> PengembalianNisbah.dart
        -> pembiayaan
            -> DetailAngsuran.dart
            -> Pembiayaan.dart
            -> RiwayatPembiayaan.dart


#### views
*Folder* ini berisikan *screen-screen* setiap fiturnya. Setiap folder di dalamnya merupakan representasi dari setiap fitur. Dan setiap *folder* fitur memiliki folder **screens** dan **widgets**. **screens** merupakan komponen *screen* yang berisi kumpulan *widget* dari *folder* **widgets** yang disusun sehingga membentuk satu *screen*. **widgets** berisi komponen *widgets* yang dapat digunakan ulang (*reusable*). Di dalamnya juga terdapat *folder* [customwidgets](lib/views/customwidgets/) yang berisi *widget-widget* yang dibuat disesuaikan dengan rancangan serta dapat digunakan ulang (*reusable*). 
Pada [views](lib/views/) juga terdapat [Main.dart]((lib/views/Main.dart) yang merupakan *file* yang menampung *screen* awal setelah pengguna *login*. Berisikan komponen *bottom navigation bar*.
Struktur dari [views](lib/views/) ini yaitu:


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


### *Library* yang Digunakan
Terdapat banyak sekali *library* yang digunakan dalam pengembangan *front-end* ini. Semua *library* diambil dari [The official package repository for Dart and Flutter apps](https://pub.dev/). *Library* yang digunakan dapat dilihat pada *file* [pubspec.yaml](pubspec.yaml) dan untuk menambahkan *dependency* dapat ditambahkan *file* tersebut pada bagian:

```yaml
dependencies:
    colorful_safe_area: ^0.3.0
    #tambahkan dependency disini
```

### *Assets* yang Digunakan
Ada beberapa *assets* yang digunakan dalam pengembangan diantaranya *fonts*, *icons* berbentuk *image*, dan *images* untuk logo dan sebagainya. Dapat dilihat pada *folder* [assets](assets/). *Assets* dapat ditambahkan melalui *folder* tersebut dan didaftarkan pada *file* [pubspec.yaml](pubspec.yaml) pada bagian:

```yaml
flutter:
    assets:
        - assets/images/
        #tambahkan folder aset gambar disini

    fonts:
        - family: Comfortaa
            fonts:
                - asset: assets/fonts/comfortaa/Comfortaa-Regular.ttf
        # tambahkan aset font disini
```


## Prasyarat
Sebelum dapat menggunakan *project* ini, diharuskan untuk:
1. Install [Flutter SDK](https://docs.flutter.dev/get-started/install) (disarankan menggunakan versi *stable* [2.5.3](https://docs.flutter.dev/development/tools/sdk/releases)). Pastikan saat menjalankan `flutter doctor` pada terminal semua *checklist* sudah centang hijau.

## Cara *Run Project*
Terdapat beberapa cara untuk *run project*. Dapat melalui *browser app* seperti chrome, *device* android yang terhubung melalui USB *debugging mode*.

### IDE Android Studio
1. Pilih *target selector* dan tekan tombol *run* pada *toolbar*
![toolbar](https://docs.flutter.dev/assets/images/docs/tools/android-studio/main-toolbar.png)

### Terminal
1. Jalankan kode dibawah untuk mendapatkan *dependency*

```cmd
flutter pub get
```

2. jalankan kode di bawah untuk mulai

## Cara Melakukan *Deployment*
*Deployment* dapat menghasilkan *multi-platform application*, diantaranya *web application*, android *application* (.apk), iOS *application* (.ipa). Kebutuhan dari *project* ini yaitu hanya *mobile application*.

### *Android App Deployment*
Untuk melakukan *deployment* android *application*, lakukan *step* di bawah ini.
1. Jalankan *command* di bawah pada terminal dengan lokasi pada *root project* untuk melakukan *deployment project* menjadi android *application*
```cmd
flutter build apk
```
2. Jika berhasil maka buka *file* .apk terdapat pada *folder* `...\simpin_syariah\build\app\outputs\flutter-apk` dengan *file* [app-release.apk](build/app/outputs/flutter-apk)