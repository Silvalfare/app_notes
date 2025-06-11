import 'package:app_notes/add_notes.dart';
import 'package:app_notes/database/db_helper.dart';
import 'package:app_notes/detail_notes.dart';
import 'package:app_notes/edit_notes.dart';
import 'package:app_notes/model/notes_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Notes',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
      ),
      body: Column(
        children: [
          daftarNotes.isEmpty
              ? Center(child: Text('Belum ada catatan'))
              : SizedBox(),
          ListView.builder(
            shrinkWrap: true,
            itemCount: daftarNotes.length,
            itemBuilder: (context, index) {
              final notes = daftarNotes[index];
              return ListTile(
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => EditNotesScreen(notes: notes),
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailNotesScreen(notes: notes),
                    ),
                  );
                },
                title: Text(notes.nama),
                subtitle: Text(notes.tanggal),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
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
