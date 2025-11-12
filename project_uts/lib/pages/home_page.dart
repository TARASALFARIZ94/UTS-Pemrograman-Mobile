import 'package:flutter/material.dart';
import '../main.dart';
import 'dashboard_page.dart';
import 'biodata_page.dart';
import 'kontak_page.dart';
import 'kalkulator_page.dart';
import 'cuaca_page.dart';
import 'berita_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final List<Widget> _pages = [
      DashboardPage(onMenuTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      }),
      const BiodataPage(),
      const KontakPage(),
      const KalkulatorPage(),
      const CuacaPage(),
      const BeritaPage(),
    ];

    final List<String> _titles = const [
      "Dashboard",
      "Biodata",
      "Kontak",
      "Kalkulator",
      "Cuaca",
      "Berita",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.wb_sunny : Icons.nightlight_round),
            tooltip: isDark ? "Mode Terang" : "Mode Gelap",
            onPressed: () {
              themeNotifier.value =
                  isDark ? ThemeMode.light : ThemeMode.dark;
            },
          ),
        ],
      ),

      // Body dengan konsep fragment
      body: IndexedStack(index: _selectedIndex, children: _pages),

      // Bottom navigation dengan Dashboard
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Biodata"),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label: "Kontak"),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "Kalkulator"),
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: "Cuaca"),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: "Berita"),
        ],
      ),
    );
  }
}