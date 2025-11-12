import 'dart:math';
import 'package:flutter/material.dart';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  final TextEditingController _input1 = TextEditingController();
  final TextEditingController _input2 = TextEditingController();
  String _hasil = "0";

  void _hitung(String operasi) {
    double a = double.tryParse(_input1.text) ?? 0;
    double b = double.tryParse(_input2.text) ?? 0;
    double hasil = 0;

    switch (operasi) {
      case '+':
        hasil = a + b;
        break;
      case '-':
        hasil = a - b;
        break;
      case '×':
        hasil = a * b;
        break;
      case '÷':
        hasil = b != 0 ? a / b : double.nan;
        break;
      case 'x²':
        hasil = pow(a, 2).toDouble();
        break;
      case '√':
        hasil = sqrt(a);
        break;
      case 'C':
        _input1.clear();
        _input2.clear();
        hasil = 0;
        break;
    }

    setState(() => _hasil = hasil.isNaN ? "Error" : hasil.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              "Kalkulator Sederhana",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            const SizedBox(height: 20),

            // Input Field 1
            TextField(
              controller: _input1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Angka Pertama",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                prefixIcon: const Icon(Icons.looks_one, color: Colors.teal),
              ),
            ),
            const SizedBox(height: 12),

            // Input Field 2
            TextField(
              controller: _input2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Angka Kedua",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                prefixIcon: const Icon(Icons.looks_two, color: Colors.teal),
              ),
            ),
            const SizedBox(height: 20),

            // Tombol Operasi
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                _tombol("+"),
                _tombol("-"),
                _tombol("×"),
                _tombol("÷"),
                _tombol("x²"),
                _tombol("√"),
                _tombol("C", warna: Colors.red),
              ],
            ),

            const SizedBox(height: 30),

            // Hasil
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.teal.shade200),
              ),
              child: Column(
                children: [
                  const Text("Hasil:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(
                    _hasil,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Tombol Operasi
  Widget _tombol(String simbol, {Color warna = Colors.teal}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: warna,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
      onPressed: () => _hitung(simbol),
      child: Text(simbol, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}