import 'package:flutter/material.dart';

class CuacaPage extends StatelessWidget {
  const CuacaPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data statis cuaca
    final String kota = "Bandung";
    final double suhu = 27.5;
    final String kondisi = "Cerah Berawan";
    final int kelembapan = 68;
    final double angin = 10.2;

    final List<Map<String, dynamic>> forecast = [
      {"hari": "Sen", "suhu": "28° / 21°", "icon": "assets/image/sunny.png"},
      {"hari": "Sel", "suhu": "29° / 22°", "icon": "assets/image/cloudy.png"},
      {"hari": "Rab", "suhu": "26° / 20°", "icon": "assets/image/rainy.png"},
      {"hari": "Kam", "suhu": "30° / 23°", "icon": "assets/image/sunny.png"},
      {"hari": "Jum", "suhu": "31° / 22°", "icon": "assets/image/cloudy.png"},
      {"hari": "Sab", "suhu": "27° / 19°", "icon": "assets/image/rainy.png"},
      {"hari": "Min", "suhu": "28° / 20°", "icon": "assets/image/sunny.png"},
    ];

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SafeArea(
        child: Column(
          children: [
            // 🌤️ Header Cuaca Sekarang
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.lightBlue.shade400, Colors.blue.shade700],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade200.withOpacity(0.6),
                    blurRadius: 10,
                    offset: const Offset(3, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.location_on, color: Colors.white, size: 28),
                      Text(
                        kota,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(Icons.more_vert, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Image.asset('assets/image/cloudy.png', width: 100, height: 100),
                  const SizedBox(height: 10),
                  Text(
                    "${suhu.toStringAsFixed(1)}°C",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    kondisi,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _infoCuaca(Icons.water_drop, "Kelembapan", "$kelembapan%"),
                      _infoCuaca(Icons.air, "Angin", "$angin km/j"),
                      _infoCuaca(Icons.thermostat, "Suhu", "${suhu.round()}°"),
                    ],
                  ),
                ],
              ),
            ),

            // 📆 Forecast Mingguan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: const [
                  Icon(Icons.calendar_today, size: 20, color: Colors.blueGrey),
                  SizedBox(width: 8),
                  Text(
                    "Prakiraan 7 Hari",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                itemCount: forecast.length,
                itemBuilder: (context, index) {
                  final item = forecast[index];
                  return Container(
                    width: 110,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item["hari"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Image.asset(item["icon"], width: 50, height: 50),
                        const SizedBox(height: 6),
                        Text(
                          item["suhu"],
                          style: const TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔸 Widget kecil info (kelembapan, angin, suhu)
  Widget _infoCuaca(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 26),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}