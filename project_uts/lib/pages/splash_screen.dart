import 'package:flutter/material.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Tunggu 5 detik lalu navigasi ke HomePage
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade300,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo / Gambar
            Image.asset(
              'assets/image/profile.jpg', // pastikan ada di folder ini
              width: 120,
              height: 120,
            ),
            const SizedBox(height: 20),
            const Text(
              "GOGOBOO",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "152023038 - Taras Al Fariz",
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 40),

            // Indicator Loading
            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}