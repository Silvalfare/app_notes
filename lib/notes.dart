import 'package:app_notes/add_notes.dart';
import 'package:app_notes/database/db_helper.dart';
import 'package:app_notes/detail_notes.dart';
import 'package:app_notes/edit_notes.dart';
import 'package:app_notes/model/notes_model.dart';
import 'package:flutter/material.dart';

class NotesScreen extends StatefulWidget {
  static const String id = "/notes_screen";
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<Notes> daftarNotes = [];

  @override
  void initState() {
    super.initState();
    muatData();
  }

  Future<void> muatData() async {
    final data = await DbHelper.getAllNotes();
    setState(() {
      daftarNotes = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          daftarNotes.isEmpty
              ? Center(
                  child: Text(
                    'Belum ada catatan',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              : SizedBox(),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: daftarNotes.length,
              itemBuilder: (context, index) {
                final notes = daftarNotes[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 8,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffE5E5E5),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: ListTile(
                      onLongPress: () => showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          actions: [
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () async {
                                    await DbHelper.deleteNotes(notes.id!);
                                    Navigator.pop(context);
                                    muatData();
                                  },
                                  child: Text('Hapus'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            EditNotesScreen(notes: notes),
                                      ),
                                    );
                                    muatData();
                                  },
                                  child: Text('Edit'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap: () async {
                        final hasil = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailNotesScreen(notes: notes),
                          ),
                        );
                        if (hasil == true) muatData();
                      },
                      title: Text(
                        notes.nama,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        notes.tanggal,
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(48)),
        ),
        backgroundColor: Color(0xffC4C4C4),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddNotesScreen()),
          );
          muatData();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
