# 🌟 Aplikasi Mobile GOGOBOO

**GOGOBOO** adalah aplikasi mobile berbasis **Flutter** yang dikembangkan sebagai tugas **Ujian Tengah Semester (UTS) Pemrograman Mobile**.  
Aplikasi ini menampilkan berbagai fitur sederhana seperti biodata, daftar kontak, kalkulator, cuaca, dan berita dengan desain interaktif dan dukungan mode gelap.

---

## 👤 **Identitas Pengembang**
| Informasi | Keterangan |
|------------|-------------|
| **Nama** | Taras Al Fariz |
| **NIM** | 1520230XX |
| **Kelas** | IF-AA |
| **Mata Kuliah** | Pemrograman Mobile |
| **Dosen Pengampu** | Galih Ashari R., S.Si., MT |
| **Semester** | Ganjil 2025/2026 |

---

## 🚀 **Fitur Utama**

### 🏁 1. Splash Screen  
- Menampilkan judul aplikasi, nama, NIM, dan foto profil.  
- Durasi 5 detik, lalu otomatis berpindah ke halaman Dashboard.  

### 🏠 2. Dashboard  
- Halaman utama dengan **Bottom Navigation Bar**.  
- Menu navigasi:  
  - 🧍 Biodata  
  - ☎️ Kontak  
  - ➕ Kalkulator  
  - 🌤️ Cuaca  
  - 📰 Berita  
- Menggunakan konsep **Fragment (IndexedStack)** agar tidak reload antar halaman.  
- Dilengkapi **mode gelap otomatis** dan tombol toggle 🌙 / ☀️ di AppBar.

### 👨‍💻 3. Halaman Biodata  
- Menampilkan foto profil dan data diri pengguna.  
- Form input berisi:
  - Nama lengkap (TextField)
  - Hobi (TextField)
  - Jurusan (Dropdown)
  - Jenis Kelamin (RadioButton)
  - Tanggal Lahir (Date Picker)
- Desain modern dengan layout responsif (scrollable).

### 📇 4. Halaman Kontak  
- Berisi **15 kontak telepon statis** dengan nama dan nomor.  
- Menggunakan **ListView.builder** dengan **CircleAvatar** dan teks.  
- Tampilan bersih dan rapi dengan warna lembut.  

### 🧮 5. Halaman Kalkulator  
- Kalkulator sederhana dengan operasi:
  - Penjumlahan (+)
  - Pengurangan (−)
  - Perkalian (×)
  - Pembagian (÷)
  - Kuadrat (x²)
  - Akar kuadrat (√)
  - Tombol hapus (C)
- Desain tombol grid seperti kalkulator asli.

### 🌤️ 6. Halaman Cuaca  
- Menampilkan data cuaca **statis**: suhu, kelembapan, kondisi, dan ikon animasi cuaca.  
- Kondisi cuaca: Cerah, Berawan, Hujan.  
- Tampilan menggunakan **Card elegan** dengan icon cuaca yang responsif.

### 📰 7. Halaman Berita  
- Menampilkan daftar berita **statis** (judul, sumber, tanggal, deskripsi, dan gambar).  
- Menggunakan **ListView.builder** dengan layout kartu (card).  
- Data berita diambil dari variabel list statis di dalam file Dart.  

---

## 🌓 **Mode Gelap Otomatis**
Aplikasi secara otomatis menyesuaikan dengan mode tema sistem (Light/Dark Mode).  
Tersedia juga tombol toggle manual di AppBar untuk beralih antara mode terang 🌞 dan gelap 🌙.

---

## 📁 **Struktur Folder Proyek**
lib/
├── main.dart
├── pages/
│ ├── splash_screen.dart
│ ├── home_page.dart
│ ├── dashboard_page.dart
│ ├── biodata_page.dart
│ ├── kontak_page.dart
│ ├── kalkulator_page.dart
│ ├── cuaca_page.dart
│ ├── berita_page.dart
assets/
└── image/
├── profile.jpg
├── sunny.png
├── cloudy.png
├── rainy.png
├── news1.jpeg
├── news2.jpeg
├── news3.jpeg

---

## 🧩 **Teknologi yang Digunakan**
- Flutter 3.x  
- Dart SDK  
- Material Design Widgets  
- Intl Package (`intl`) untuk format tanggal  
- Dark Mode Theme Switching (manual & otomatis)

---

## 💡 **Cara Menjalankan Proyek**
1. Pastikan Flutter SDK sudah terinstal di komputer kamu.  
2. Clone repositori ini:
   ```bash
   git clone https://github.com/<username>/UTS-Pemrograman-Mobile.git
