import 'package:app_notes/database/db_helper.dart';
import 'package:app_notes/model/notes_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController isiController = TextEditingController();
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

  Future<void> simpanData() async {
    final nama = namaController.text;
    final tanggal = tanggalController.text;
    final isi = tanggalController.text;

    if (nama.isNotEmpty && isi.isNotEmpty) {
      await DbHelper.insertNotes(Notes(nama: nama, tanggal: tanggal, isi: isi));
      namaController.clear();
      tanggalController.clear();
      isiController.clear();
      muatData();
    }
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
          Padding(
            padding: const EdgeInsets.all(32),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffE5E5E5),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              width: 311,
              height: 32,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Find your notes',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.search),
                ],
              ),
            ),
          ),
          SizedBox(),
          // ListView.builder(
          //   itemCount: 1,
          //   itemBuilder: (BuildContext context, int index) {
          //     return;
          //   },
          // ),
        ],
      ),
    );
  }
}
