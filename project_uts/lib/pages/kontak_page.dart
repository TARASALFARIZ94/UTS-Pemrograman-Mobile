import 'package:flutter/material.dart';

class KontakPage extends StatelessWidget {
  const KontakPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔹 Data kontak statis
    final List<Map<String, String>> kontakList = [
      {"nama": "Taras Al Fariz", "nomor": "0812-3456-7890", "foto": "assets/image/profile.jpg"},
      {"nama": "Pandu Satriajati Utama", "nomor": "0813-2222-3344", "foto": "assets/image/gambar1.jpeg"},
      {"nama": "Muhammad Salman Al Farisy", "nomor": "0814-1234-5678", "foto": "assets/image/gambar14.jpeg"},
      {"nama": "Sakhiy Amru Abdillah", "nomor": "0815-9876-5432", "foto": "assets/image/gambar3.jpeg"},
      {"nama": "Aditya Budi Septiawan", "nomor": "0816-1122-3344", "foto": "assets/image/gambar4.jpeg"},
      {"nama": "Kahla Arsyaba", "nomor": "0817-7788-9900", "foto": "assets/image/gambar5.jpeg"},
      {"nama": "Ni Made Dwi Salsa Anggraeni", "nomor": "0818-6677-8899", "foto": "assets/image/gambar6.jpeg"},
      {"nama": "Muhammad Faisal Abdurrahman", "nomor": "0819-5555-6666", "foto": "assets/image/gambar7.jpeg"},
      {"nama": "Chandra Kirana Irawan", "nomor": "0821-1234-5678", "foto": "assets/image/gambar8.jpeg"},
      {"nama": "Lutfi Ali Hazim", "nomor": "0822-8888-9999", "foto": "assets/image/gambar9.jpeg"},
      {"nama": "Muhammad Fauzan", "nomor": "0823-1122-3344", "foto": "assets/image/gambar10.jpeg"},
      {"nama": "Muhammad Alif Syaikhan", "nomor": "0824-2233-4455", "foto": "assets/image/gambar11.jpeg"},
      {"nama": "Ilham Rizky Nugraha", "nomor": "0825-5566-7788", "foto": "assets/image/gambar12.jpeg"},
      {"nama": "Hadi Hisyam Mustawan", "nomor": "0826-6677-8899", "foto": "assets/image/gambar13.jpeg"},
      {"nama": "Nasywa Adita Zain", "nomor": "0827-7788-9900", "foto": "assets/image/gambar2.jpeg"},
    ];

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: kontakList.length,
        itemBuilder: (context, index) {
          final kontak = kontakList[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: CircleAvatar(
                backgroundImage: AssetImage(kontak['foto']!),
                radius: 28,
              ),
              title: Text(
                kontak['nama']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                kontak['nomor']!,
                style: const TextStyle(color: Colors.teal),
              ),
              trailing: const Icon(Icons.phone, color: Colors.teal),
            ),
          );
        },
      ),
    );
  }
}