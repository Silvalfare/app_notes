import 'package:Notes/database/db_helper.dart';
import 'package:Notes/model/notes_model.dart';
import 'package:Notes/utils/custom_elevated_button.dart';
import 'package:Notes/utils/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({super.key});

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController isiController = TextEditingController();

  Future<void> simpanData() async {
    if (_formKey.currentState!.validate()) {
      final nama = namaController.text;
      final isi = isiController.text;

      await DbHelper.insertNotes(Notes(nama: nama, isi: isi));
      // namaController.clear();
      // tanggalController.clear();
      // isiController.clear();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Notes'), backgroundColor: Colors.white),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField(
              controller: namaController,
              label: 'Nama',
              validator: (value) =>
                  value == null || value.isEmpty ? "Wajib diisi" : null,
            ),
            CustomTextField(
              validator: (value) =>
                  value == null || value.isEmpty ? "Wajib diisi" : null,
              controller: isiController,
              label: 'Isi',
              maxLines: 4,
            ),
            CustomElevatedButton(
              text: 'Add',
              onPressed: simpanData,
              backgroundColor: Colors.black,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
