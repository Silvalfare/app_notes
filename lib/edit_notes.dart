import 'package:app_notes/database/db_helper.dart';
import 'package:app_notes/model/notes_model.dart';
import 'package:app_notes/utils/custom_elevated_button.dart';
import 'package:app_notes/utils/custom_text_field.dart';
import 'package:flutter/material.dart';

class EditNotesScreen extends StatefulWidget {
  final Notes notes;
  const EditNotesScreen({super.key, required this.notes});

  @override
  State<EditNotesScreen> createState() => _EditNotesScreenState();
}

class _EditNotesScreenState extends State<EditNotesScreen> {
  late TextEditingController namaController;
  late TextEditingController tanggalController;
  late TextEditingController isiController;

  @override
  void initState() {
    namaController = TextEditingController(text: widget.notes.nama);
    tanggalController = TextEditingController(text: widget.notes.tanggal);
    isiController = TextEditingController(text: widget.notes.isi);
    super.initState();
  }

  void update() async {
    final updated = Notes(
      id: widget.notes.id,
      nama: namaController.text,
      tanggal: tanggalController.text,
      isi: isiController.text,
    );
    await DbHelper.updateNotes(updated);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Edit ${widget.notes.nama}'),
      ),
      body: Column(
        children: [
          CustomTextField(controller: namaController, label: 'Nama'),
          CustomTextField(controller: tanggalController, label: 'Tanggal'),
          CustomTextField(controller: isiController, label: 'Isi'),
          CustomElevatedButton(text: 'Update', onPressed: update),
        ],
      ),
    );
  }
}
