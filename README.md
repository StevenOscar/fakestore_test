# fakestore_test

Aplikasi Fakestore Test ini adalah aplikasi yang menampilkan berbagai produk yang didapatkan melalui [fakestoreapi.com]('https://fakestoreapi.com'). Pada aplikasi ini, pengguna dapat melihat daftar produk, memfilter produk berdasarkan kategori, melakukan pencarian produk, dan melihat detail produk. Aplikasi ini dibuat menggunakan state management Riverpod.

## 🧩 Fitur

### 🔍 1. Pencarian Produk (Search)

- Search bar pada AppBar
- Pencarian berdasarkan **title** dan **category**

### 🏷️ 2. Filter Berdasarkan Kategori

- Filter kategori dalam bentuk *chip list*
- Dapat memfilter daftar produk sesuai pilihan

### 🧱 3. Grid Produk (Staggered Masonry Grid)

- Menggunakan `flutter_staggered_grid_view`

### 📄 4. Detail Produk

- Menampilkan Judul, harga, rating, gambar, kategori produk ,dan deskripsi

### 📦 5. Riverpod State Management

- Menangani state: loading, error, dan data

---

## Package yang digunakan

1. envied: ^1.3.1
2. flutter_riverpod: ^3.0.3
3. dio: ^5.9.0
4. cached_network_image: ^3.4.1
5. flutter_staggered_grid_view: ^0.7.0

## ▶️ Petunjuk Menjalankan Aplikasi

Setelah melakukan clone repository, buat file .env pada root project, kemudian ketik 'FAKESTORE_BASE_URL = ['https://fakestoreapi.com'] lalu jalankan perintah dibawah ini pada terminal untuk melakukan setup environment:

```bash
dart run build_runner build
