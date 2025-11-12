import 'package:flutter/material.dart';
import '../models/kontak.dart';

class KontakCard extends StatelessWidget {
  final Kontak kontak;
  const KontakCard({required this.kontak});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: AssetImage(kontak.foto)),
      title: Text(kontak.nama),
      subtitle: Text(kontak.nomor),
    );
  }
}