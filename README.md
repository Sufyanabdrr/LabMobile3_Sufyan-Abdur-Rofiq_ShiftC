![image](https://github.com/user-attachments/assets/08f61d08-a370-4b54-92a8-c13c1d2181ec)
A. Penjelasan Kode :

1. login_page.dart :
   
- Imports:
Menggunakan paket Flutter untuk membangun UI (flutter/material.dart), halaman beranda (home_page.dart), dan shared_preferences untuk menyimpan data sederhana secara lokal.

- LoginPage Widget:
LoginPage adalah widget Stateful yang memiliki state _LoginPageState, di mana logika dan tampilan halaman login diatur.

- State Variables:
Menggunakan TextEditingController untuk mengontrol input teks username dan password.

- _saveUsername():
Method ini menyimpan username yang dimasukkan ke penyimpanan lokal menggunakan SharedPreferences.

- _showInput():
Method untuk membuat widget input teks (username dan password) dengan label dan placeholder.

- _showDialog():
Menampilkan dialog dengan pesan dan mengarahkan pengguna ke halaman lain setelah menekan tombol "OK".

- build():
Membangun UI halaman login dengan latar belakang gambar, input username dan password, serta tombol login.
Jika login berhasil (username dan password adalah "admin"), menyimpan username dan navigasi ke HomePage. Jika gagal, menampilkan dialog error.
Kode ini adalah implementasi halaman login sederhana yang memverifikasi username dan password, menampilkan pesan sukses atau error, dan mengarahkan pengguna ke halaman lain jika login berhasil.

2. home_page.dart
   
- Imports:
Material: Menggunakan paket flutter/material.dart untuk membangun antarmuka pengguna (UI).
SharedPreferences: Menggunakan shared_preferences untuk menyimpan dan memuat data pengguna secara lokal.
Sidemenu dan MissionPage: Mengimpor dua widget lain (sidemenu.dart dan mission_page.dart) yang digunakan di halaman utama.

- HomePage Widget:
HomePage adalah widget Stateful, artinya dapat berubah-ubah seiring waktu. State-nya dikelola oleh _HomePageState.

- State Variable:
namauser: Variabel untuk menyimpan username yang dimuat dari SharedPreferences.

- initState():
initState adalah method yang dijalankan saat widget diinisialisasi. Di sini, digunakan untuk memuat username dari SharedPreferences dengan memanggil _loadUsername().

- _loadUsername():
Method ini digunakan untuk mendapatkan username yang telah disimpan di SharedPreferences dan menampilkannya di UI.

- build() Method:
build adalah method utama yang membangun antarmuka pengguna untuk halaman ini.
AppBar: Header aplikasi dengan judul "SufyanGaming - Home" dan ikon game.
Container: Mengatur latar belakang halaman dengan gambar.
Center & Column: Mengatur elemen-elemen di tengah halaman.
Icon & Text: Menampilkan ikon dan teks "Welcome" yang menyambut pengguna dengan username mereka atau "Avenger" jika username tidak ditemukan.
ElevatedButton: Tombol yang akan mengarahkan pengguna ke halaman MissionPage saat ditekan.
Drawer: Menyertakan menu samping (Sidemenu) untuk navigasi.

- Navigasi ke MissionPage:
Tombol "Start Mission Games" menggunakan Navigator.push untuk berpindah ke halaman MissionPage.
Kode ini membuat halaman utama dengan tampilan yang menyambut pengguna. Setelah memuat username dari SharedPreferences, nama pengguna ditampilkan. Halaman ini juga menyediakan navigasi ke halaman misi melalui tombol "Start Mission Games". Selain itu, ada menu samping (drawer) untuk navigasi lainnya.

3. sidemenu.dart

- Imports:
Kode ini mengimpor paket flutter/material.dart dan beberapa halaman lain (home_page.dart, about_page.dart, dan mission_page.dart) yang akan digunakan di dalam menu samping.

- Sidemenu Widget:
Sidemenu adalah widget Stateless yang berarti widget ini tidak memiliki state yang dapat berubah selama siklus hidupnya.

- Drawer:
Drawer adalah widget yang digunakan untuk membuat menu samping (side menu) di aplikasi Flutter. Menu ini biasanya ditampilkan dengan menggeser layar dari kiri ke kanan atau dengan menekan ikon hamburger di sudut kiri atas aplikasi.

- Container:
Container digunakan untuk mengatur tampilan dan warna latar belakang menu samping (color: Colors.grey[900] memberikan warna abu-abu gelap).

- ListView:
ListView digunakan untuk membuat daftar item yang dapat digulir. Semua item menu dalam Drawer diletakkan di dalam ListView ini.

- DrawerHeader:
DrawerHeader adalah header dari menu samping. Header ini berisi logo dan teks deskriptif.
Decoration: Mengatur tampilan latar belakang dengan warna merah dan menampilkan gambar logo dari URL.
Text: Menampilkan judul "SufyanGaming - Menu" dan subjudul "Level Up Your Mobile Gaming Journey".

- ListTile:
ListTile digunakan untuk membuat item menu yang dapat diklik oleh pengguna.
Icon: Setiap ListTile memiliki ikon yang terkait dengan fungsi masing-masing halaman (misalnya, ikon rumah untuk HomePage).
Text: Setiap ListTile juga memiliki teks yang menunjukkan nama halaman (misalnya, "Home Page", "About Page").
onTap: Fungsi onTap digunakan untuk menangani navigasi saat item menu diklik.
Navigator.pushReplacement: Mengganti halaman saat ini dengan halaman baru tanpa menyimpan halaman sebelumnya di stack navigasi.
Navigator.push: Menambahkan halaman baru ke stack navigasi, memungkinkan pengguna kembali ke halaman sebelumnya.

- Divider:
Divider adalah garis horizontal yang memisahkan item menu untuk memberikan pemisahan visual yang lebih baik antar kelompok menu.
Kode ini membuat menu samping (side menu) dengan beberapa opsi navigasi seperti "Home Page," "About Page," dan "Mission Games Page." Pengguna dapat mengklik salah satu opsi untuk berpindah ke halaman yang terkait. Menu samping ini juga memiliki header dengan logo dan teks yang menambah estetika dan identitas aplikasi.

4. about_page.dart
   
- Imports:
Kode ini mengimpor flutter/material.dart untuk menggunakan berbagai widget dan komponen yang disediakan oleh Flutter.
sidemenu.dart diimpor untuk menampilkan menu samping di halaman ini.

- AboutPage Widget:
AboutPage adalah widget Stateful yang berarti widget ini dapat memiliki state yang berubah selama siklus hidupnya.

- Stateful Widget:
_isEditing: Variabel boolean untuk mengatur apakah pengguna sedang dalam mode mengedit (true) atau tidak (false).
TextEditingController: Digunakan untuk mengontrol dan menyimpan teks yang dimasukkan dalam TextField. Ada tiga controller untuk mengontrol judul (_titleController), subjudul (_subtitleController), dan deskripsi (_descriptionController).

- _showInput Method:
Metode ini digunakan untuk menampilkan input berdasarkan status _isEditing.
Jika _isEditing adalah true, maka TextField akan muncul untuk memungkinkan pengguna mengedit teks.
Jika _isEditing adalah false, maka teks akan ditampilkan dalam Text widget.

- AppBar:
AppBar di bagian atas layar menampilkan judul "SufyanGaming - About" dengan ikon game. Latar belakang AppBar berwarna merah.

- Body:
Container: Bagian utama dari halaman diatur dengan background gambar dan Center yang menempatkan konten di tengah layar.
SingleChildScrollView: Membungkus Column untuk memungkinkan scrolling ketika konten lebih panjang dari layar.
CircleAvatar: Menampilkan avatar bundar dengan ikon game berwarna merah di tengahnya.
_showInput Widgets: Menampilkan judul, subjudul, dan deskripsi, baik dalam bentuk TextField atau Text tergantung pada mode edit.
ElevatedButton: Tombol ini mengubah mode antara mengedit dan menyimpan. Jika dalam mode edit, tombol akan menampilkan 'Save'. Jika tidak dalam mode edit, tombol akan menampilkan 'Edit'.

- Drawer:
Sidemenu: Drawer untuk menampilkan menu samping yang diatur di file sidemenu.dart.
Kode ini membuat halaman "About" untuk aplikasi SufyanGaming. Halaman ini menampilkan judul, subjudul, dan deskripsi yang dapat diedit oleh pengguna. Ada juga gambar avatar dan tombol untuk beralih antara mode edit dan lihat. Menu samping disertakan untuk navigasi ke halaman lain dalam aplikasi.

5. mission_page.dart
   
- Imports:
Kode ini hanya mengimpor flutter/material.dart yang menyediakan berbagai widget dasar untuk membuat antarmuka pengguna di Flutter.

- MissionPage Widget:
MissionPage adalah widget StatelessWidget yang menampilkan halaman misi dengan beberapa kartu game.

- Scaffold dan AppBar:
Scaffold menyediakan struktur dasar untuk halaman, termasuk AppBar di bagian atas dengan judul "Mission Games Page" dan latar belakang berwarna merah.

- GridView:
Halaman utama (body) berisi GridView.count, yang mengatur layout game dalam bentuk grid dengan 2 kolom. Setiap item dalam grid adalah sebuah game yang ditampilkan sebagai kartu (card).

- _buildGameCard Method:
Metode _buildGameCard bertanggung jawab untuk membuat tampilan setiap kartu game dalam grid. Ini termasuk gambar, nama game, dan tombol untuk memulai misi.

- Card Structure:
Image: Gambar game ditampilkan di bagian atas kartu. Gambar diambil dari URL yang diberikan.
Error Handling: Jika gambar gagal dimuat, akan ditampilkan ikon image_not_supported dengan latar belakang abu-abu.
Text: Nama game ditampilkan di bawah gambar dengan teks yang besar dan tebal.
ElevatedButton: Tombol "Start Mission" berada di bagian bawah kartu. Jika ditekan, akan menavigasi pengguna ke halaman GameDetailPage yang menampilkan detail lebih lanjut tentang game tersebut.

- GameDetailPage Widget:
GameDetailPage adalah widget StatelessWidget yang digunakan untuk menampilkan detail misi dari game yang dipilih.
AppBar: Menampilkan nama game sebagai judul dengan latar belakang berwarna merah.
Body: Teks di tengah halaman yang mengindikasikan bahwa misi untuk game tertentu telah dimulai.
Kode ini membuat halaman misi untuk aplikasi game yang menampilkan berbagai game dalam format grid. Setiap game ditampilkan dengan gambar, nama, dan tombol untuk memulai misi. Saat pengguna memilih game dan menekan tombol "Start Mission", mereka akan diarahkan ke halaman detail yang mengonfirmasi bahwa misi untuk game tersebut telah dimulai.

6. main.dart
   
- Imports:
Kode ini mengimpor beberapa file Dart (login_page.dart, home_page.dart, about_page.dart, sidemenu.dart, dan mission_page.dart) yang berisi widget yang digunakan dalam aplikasi.
flutter/material.dart adalah package utama yang digunakan untuk membangun aplikasi Flutter berbasis Material Design.

- Fungsi main:
Fungsi main adalah titik awal eksekusi aplikasi. Fungsi ini memanggil runApp() yang menjalankan aplikasi Flutter.
MyApp adalah widget yang di-passing ke runApp() sebagai widget root dari aplikasi.

- Kelas MyApp:
MyApp adalah widget StatelessWidget, yang berarti ini adalah widget yang tidak memiliki state internal yang berubah-ubah.
Kelas ini berfungsi sebagai widget root aplikasi dan mengatur konfigurasi dasar untuk seluruh aplikasi.

- Method build:
Method build digunakan untuk membangun tampilan antarmuka pengguna.
MaterialApp:
MaterialApp adalah widget yang menyediakan sejumlah konfigurasi dasar untuk aplikasi Flutter berbasis Material Design. Ini mengatur tema, rute, title, dan beberapa properti lainnya.
title: Memberikan judul untuk aplikasi, dalam hal ini "Tugas Pertemuan 3". Judul ini dapat digunakan oleh sistem operasi untuk menampilkan nama aplikasi.
home: Properti home menentukan widget pertama yang akan ditampilkan saat aplikasi dimulai. Di sini, LoginPage digunakan sebagai halaman pertama.

- LoginPage:
LoginPage adalah widget yang menjadi halaman pertama (homepage) dari aplikasi ini, sesuai dengan yang didefinisikan pada properti home di MaterialApp.
Kode ini mendefinisikan aplikasi Flutter dengan titik masuk pada fungsi main. Aplikasi ini memiliki MyApp sebagai widget root, yang di dalamnya menggunakan MaterialApp untuk mengatur konfigurasi dasar aplikasi. LoginPage adalah halaman pertama yang ditampilkan ketika aplikasi dijalankan. Aplikasi ini juga terhubung dengan beberapa halaman lain seperti HomePage, AboutPage, dan MissionPage melalui file Dart yang terpisah, meskipun mereka belum digunakan dalam kode ini.

B. Screenshot Tampilan Aplikasi :

1. login_page.dart :
   ![image](https://github.com/user-attachments/assets/667568c7-b8dd-4aa6-83d1-35eeffe6b785)
   ![image](https://github.com/user-attachments/assets/177e668b-7eab-4204-84f6-7e7e6faceb73)
   ![image](https://github.com/user-attachments/assets/d2daba15-0f3e-4564-8b6c-b1e43a11af79)

2. home_page.dart :
   ![image](https://github.com/user-attachments/assets/fc5c9516-f0eb-459b-9ddf-57a3267456dd)

3. sidemenu.dart :
   ![image](https://github.com/user-attachments/assets/72cc172b-cc1d-490c-a1d2-8db5d9c5f94f)

4. about_page.dart :
   ![image](https://github.com/user-attachments/assets/7282da3d-5112-40a4-9c2d-7135d7035320)
   ![image](https://github.com/user-attachments/assets/9a3ffd54-615c-44bb-a311-c3c948403fb0)

6. mission_page.dart :
   ![image](https://github.com/user-attachments/assets/c2a33000-510a-4e12-b8c7-06220d86fccc)
   ![image](https://github.com/user-attachments/assets/08e071ef-43b5-45aa-b080-457f463705a5)
   ![image](https://github.com/user-attachments/assets/c7bffa76-7653-4fe0-9f27-fbedf1618a2c)
   ![image](https://github.com/user-attachments/assets/0a912927-ab53-4a7f-a954-73f95b1e6458)
   ![image](https://github.com/user-attachments/assets/2c251c0d-6cdd-4a46-923f-9ebdb650be2b)
   ![image](https://github.com/user-attachments/assets/e1393126-7e8c-45f4-a516-ee53c85af276)






   
   

   





   
