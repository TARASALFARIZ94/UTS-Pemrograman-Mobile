import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  final Function(int) onMenuTap;
  const DashboardPage({super.key, required this.onMenuTap});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  final List<Map<String, dynamic>> menuList = [
    {"icon": Icons.person, "title": "Biodata", "color": Colors.teal, "index": 1},
    {"icon": Icons.contacts, "title": "Kontak", "color": Colors.blue, "index": 2},
    {"icon": Icons.calculate, "title": "Kalkulator", "color": Colors.orange, "index": 3},
    {"icon": Icons.cloud, "title": "Cuaca", "color": Colors.purple, "index": 4},
    {"icon": Icons.article, "title": "Berita", "color": Colors.green, "index": 5},
  ];

  @override
  void initState() {
    super.initState();

    // 🔹 Controller animasi
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    // Jalankan animasi setelah frame pertama
    Future.delayed(const Duration(milliseconds: 200), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [Colors.black, Colors.grey.shade900]
                : [Colors.teal.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              "Selamat Datang di GOGOBOO 👋",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.tealAccent : Colors.teal.shade700,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "Pilih menu di bawah untuk melanjutkan",
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 30),

            // 🔹 Grid Menu dengan animasi
            Expanded(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1.05,
                    ),
                    itemCount: menuList.length,
                    itemBuilder: (context, index) {
                      final menu = menuList[index];
                      final delay = index * 100; // jeda antar item (stagger)
                      return AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          final progress =
                              (_controller.value * 1000 - delay).clamp(0, 1000) / 1000;
                          final opacity = progress;
                          final scale = 0.9 + (0.1 * progress);

                          return Opacity(
                            opacity: opacity,
                            child: Transform.scale(
                              scale: scale,
                              child: _buildMenuCard(
                                icon: menu["icon"],
                                title: menu["title"],
                                color: menu["color"],
                                onTap: () => widget.onMenuTap(menu["index"]),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color.withOpacity(0.12),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.25),
              blurRadius: 8,
              offset: const Offset(3, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.2),
              radius: 36,
              child: Icon(icon, color: color, size: 36),
            ),
            const SizedBox(height: 14),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}