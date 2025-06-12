import 'package:Notes/database/db_helper.dart';
import 'package:Notes/model/notes_model.dart';
import 'package:Notes/utils/custom_elevated_button.dart';
import 'package:Notes/utils/custom_text_field.dart';
import 'package:flutter/material.dart';

class EditNotesScreen extends StatefulWidget {
  final Notes notes;
  const EditNotesScreen({super.key, required this.notes});

  @override
  State<EditNotesScreen> createState() => _EditNotesScreenState();
}

class _EditNotesScreenState extends State<EditNotesScreen> {
  late TextEditingController namaController;
  late TextEditingController isiController;

  @override
  void initState() {
    namaController = TextEditingController(text: widget.notes.nama);
    isiController = TextEditingController(text: widget.notes.isi);
    super.initState();
  }

  void update() async {
    final updated = Notes(
      id: widget.notes.id,
      nama: namaController.text,
      isi: isiController.text,
      tanggal: widget.notes.tanggal,
    );
    await DbHelper.updateNotes(updated);
    Navigator.pop(context, true);
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
          CustomTextField(
            controller: namaController,
            label: 'Nama',
            validator: (value) =>
                value == null || value.isEmpty ? "Wajib diisi" : null,
          ),
          CustomTextField(
            controller: isiController,
            label: 'Isi',
            maxLines: 4,
            validator: (value) =>
                value == null || value.isEmpty ? "Wajib diisi" : null,
          ),
          CustomElevatedButton(
            text: 'Update',
            onPressed: () {
              update();
            },
            backgroundColor: Colors.black,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
