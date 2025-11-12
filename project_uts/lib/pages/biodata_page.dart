import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BiodataPage extends StatefulWidget {
  const BiodataPage({super.key});

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _hobbyCtrl = TextEditingController();

  String? _gender;
  String? _selectedMajor;
  DateTime? _birthDate;

  final List<String> _majors = ["Informatika", "Sistem Informasi", "DKV", "Teknik Industri"];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? DateTime(2000, 1, 1),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _birthDate) {
      setState(() {
        _birthDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              // 🖼️ Foto profil
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 60,
                backgroundImage: const AssetImage('assets/image/profile.jpg'),
                backgroundColor: isDark ? Colors.grey[800] : Colors.grey[300],
              ),

              const SizedBox(height: 16),
              const Text(
                "Formulir Biodata",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Lengkapi informasi pribadi kamu di bawah ini",
                style: TextStyle(color: Colors.grey[600]),
              ),

              const SizedBox(height: 25),

              // 📋 Card berisi form
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: isDark ? Colors.grey[900] : Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // Nama
                      TextField(
                        controller: _nameCtrl,
                        decoration: const InputDecoration(
                          labelText: "Nama Lengkap",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Hobi
                      TextField(
                        controller: _hobbyCtrl,
                        decoration: const InputDecoration(
                          labelText: "Hobi",
                          prefixIcon: Icon(Icons.favorite),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Jenis kelamin
                      Row(
                        children: [
                          const Icon(Icons.wc, color: Colors.teal),
                          const SizedBox(width: 10),
                          const Text("Jenis Kelamin:"),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Row(
                              children: [
                                Radio<String>(
                                  value: "Laki-laki",
                                  groupValue: _gender,
                                  onChanged: (value) {
                                    setState(() {
                                      _gender = value;
                                    });
                                  },
                                ),
                                const Text("Laki-laki"),
                                Radio<String>(
                                  value: "Perempuan",
                                  groupValue: _gender,
                                  onChanged: (value) {
                                    setState(() {
                                      _gender = value;
                                    });
                                  },
                                ),
                                const Text("Perempuan"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),

                      // Jurusan
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: "Jurusan",
                          prefixIcon: Icon(Icons.school),
                          border: OutlineInputBorder(),
                        ),
                        value: _selectedMajor,
                        items: _majors
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() => _selectedMajor = val);
                        },
                      ),
                      const SizedBox(height: 15),

                      // Tanggal lahir
                      InkWell(
                        onTap: () => _selectDate(context),
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            labelText: "Tanggal Lahir",
                            prefixIcon: Icon(Icons.calendar_month),
                            border: OutlineInputBorder(),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _birthDate == null
                                    ? "Pilih tanggal"
                                    : DateFormat('dd MMMM yyyy').format(_birthDate!),
                                style: TextStyle(
                                  color: _birthDate == null
                                      ? Colors.grey
                                      : (isDark ? Colors.white : Colors.black),
                                ),
                              ),
                              const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),

                      // Tombol Simpan
                      ElevatedButton.icon(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Data disimpan!\nNama: ${_nameCtrl.text}\nHobi: ${_hobbyCtrl.text}\nGender: $_gender\nJurusan: $_selectedMajor\nTanggal: ${_birthDate != null ? DateFormat('dd/MM/yyyy').format(_birthDate!) : '-'}",
                              ),
                              duration: const Duration(seconds: 3),
                              backgroundColor: Colors.teal,
                            ),
                          );
                        },
                        icon: const Icon(Icons.save),
                        label: const Text("Simpan Data"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}