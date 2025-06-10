import 'package:app_notes/model/notes_model.dart';
import 'package:flutter/material.dart';

class DetailNotesScreen extends StatelessWidget {
  final Notes notes;
  const DetailNotesScreen({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(notes.nama)),
      body: Column(children: [Text(notes.isi)]),
    );
  }
}
