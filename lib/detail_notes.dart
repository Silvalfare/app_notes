import 'package:app_notes/database/db_helper.dart';
import 'package:app_notes/edit_notes.dart';
import 'package:app_notes/model/notes_model.dart';
import 'package:flutter/material.dart';

class DetailNotesScreen extends StatefulWidget {
  final Notes notes;
  const DetailNotesScreen({super.key, required this.notes});

  @override
  State<DetailNotesScreen> createState() => _DetailNotesScreenState();
}

class _DetailNotesScreenState extends State<DetailNotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(widget.notes.nama),
            Spacer(),
            IconButton(
              onPressed: () async {
                final konfirmasi = await showDialog<bool>(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Hapus Catatan?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: Text('Batal'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: Text('Hapus'),
                      ),
                    ],
                  ),
                );
                if (konfirmasi == true) {
                  await DbHelper.deleteNotes(widget.notes.id!);
                  Navigator.pop(context, true);
                }
              },
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(widget.notes.isi, style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(48)),
        ),
        backgroundColor: Color(0xffC4C4C4),
        onPressed: () async {
          final hasil = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => EditNotesScreen(notes: widget.notes),
            ),
          );
          if (hasil == true) {
            Navigator.pop(context, true);
          }
        },
        child: Image.asset('assets/images/Edit.png'),
      ),
    );
  }
}
