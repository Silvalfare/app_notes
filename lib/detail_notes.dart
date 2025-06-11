import 'package:app_notes/model/notes_model.dart';
import 'package:flutter/material.dart';

class DetailNotesScreen extends StatelessWidget {
  final Notes notes;
  const DetailNotesScreen({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, title: Text(notes.nama)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(notes.isi, style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
