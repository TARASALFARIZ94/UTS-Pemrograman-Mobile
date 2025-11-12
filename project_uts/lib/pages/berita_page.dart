import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BeritaPage extends StatelessWidget {
  const BeritaPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔹 Data statis berita
    final List<Map<String, dynamic>> beritaList = [
      {
        "judul": "OpenAI umumkan platform baru untuk membuat ChatGPT kustom",
        "sumber": "The Verge",
        "tanggal": DateTime(2025, 11, 12, 19, 30),
        "gambar": "assets/image/news1.jpeg",
        "isi": "OpenAI telah meluncurkan platform baru yang memungkinkan pengguna membuat ChatGPT kustom sesuai kebutuhan mereka."
      },
      {
        "judul": "Program panda raksasa di National Zoo akan berakhir akhir tahun ini",
        "sumber": "CNN",
        "tanggal": DateTime(2025, 11, 12, 20, 30),
        "gambar": "assets/image/news2.jpeg",
        "isi": "Tiga panda raksasa yang lucu di National Zoo akan kembali ke Tiongkok setelah program kerja sama berakhir."
      },
      {
        "judul": "Flutter 4.0 membawa performa super cepat untuk mobile dan web",
        "sumber": "TechCrunch",
        "tanggal": DateTime(2025, 11, 11, 10, 45),
        "gambar": "assets/image/news3.jpeg",
        "isi": "Versi terbaru Flutter hadir dengan engine rendering baru yang meningkatkan performa dan stabilitas aplikasi lintas platform."
      },
      {
        "judul": "NASA akan meluncurkan misi bulan berikutnya tahun depan",
        "sumber": "BBC News",
        "tanggal": DateTime(2025, 11, 10, 14, 20),
        "gambar": "assets/image/news4.jpeg",
        "isi": "Misi Artemis II akan menjadi langkah besar manusia menuju eksplorasi ruang angkasa yang lebih jauh lagi."
      },
      {
        "judul": "Indonesia resmi menjadi tuan rumah AI Summit 2026",
        "sumber": "Kompas Tech",
        "tanggal": DateTime(2025, 11, 9, 9, 15),
        "gambar": "assets/image/news5.jpeg",
        "isi": "Acara bergengsi ini akan mempertemukan pakar AI dari seluruh dunia untuk membahas etika dan masa depan kecerdasan buatan."
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: beritaList.length,
        itemBuilder: (context, index) {
          final berita = beritaList[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  blurRadius: 8,
                  offset: const Offset(2, 4),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🖼️ Gambar berita
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    bottomLeft: Radius.circular(14),
                  ),
                  child: Image.asset(
                    berita["gambar"],
                    width: 110,
                    height: 110,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.image, size: 80, color: Colors.grey),
                  ),
                ),

                // 📄 Isi berita
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          berita["judul"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          berita["isi"],
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                            height: 1.3,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              berita["sumber"],
                              style: const TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              DateFormat("yyyy-MM-dd HH:mm").format(berita["tanggal"]),
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}