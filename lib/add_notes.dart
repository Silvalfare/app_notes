import 'package:app_notes/database/db_helper.dart';
import 'package:app_notes/model/notes_model.dart';
import 'package:app_notes/utils/custom_elevated_button.dart';
import 'package:app_notes/utils/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({super.key});

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController isiController = TextEditingController();

  Future<void> simpanData() async {
    if (_formKey.currentState!.validate()) {
      final nama = namaController.text;
      final tanggal = tanggalController.text;
      final isi = tanggalController.text;

      await DbHelper.insertNotes(Notes(nama: nama, tanggal: tanggal, isi: isi));
      // namaController.clear();
      // tanggalController.clear();
      // isiController.clear();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField(controller: namaController, label: 'Nama'),
            CustomTextField(controller: tanggalController, label: 'Tanggal'),
            CustomTextField(controller: isiController, label: 'Isi'),
            CustomElevatedButton(text: 'Add', onPressed: simpanData),
          ],
        ),
      ),
    );
  }
}
