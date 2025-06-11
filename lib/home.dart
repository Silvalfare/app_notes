import 'package:app_notes/database/db_helper.dart';
import 'package:app_notes/info_aplikasi.dart';
import 'package:app_notes/landing_page.dart';
import 'package:app_notes/model/notes_model.dart';
import 'package:app_notes/notes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "/home_screen";
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

  final List<Widget> _screen = [NotesScreen(), AboutPageScreen()];

  final List<String> title = ['Notes', 'Tentang Aplikasi'];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title[currentIndex]),
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            ListTile(
              tileColor: currentIndex == 0 ? Colors.black : Colors.white,
              leading: Icon(
                Icons.note_add,
                color: currentIndex == 0 ? Colors.white : Colors.black,
              ),
              title: Text(
                'Notes',
                style: TextStyle(
                  color: currentIndex == 0 ? Colors.white : Colors.black,
                ),
              ),
              onTap: () {
                setState(() {
                  currentIndex = 0;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              tileColor: currentIndex == 1 ? Colors.black : Colors.white,
              leading: Icon(
                Icons.info,
                color: currentIndex == 1 ? Colors.white : Colors.black,
              ),
              title: Text(
                'About',
                style: TextStyle(
                  color: currentIndex == 1 ? Colors.white : Colors.black,
                ),
              ),
              onTap: () {
                setState(() {
                  currentIndex = 1;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              tileColor: currentIndex == 2 ? Colors.black : Colors.white,
              leading: Icon(
                Icons.exit_to_app,
                color: currentIndex == 2 ? Colors.white : Colors.black,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                  color: currentIndex == 2 ? Colors.white : Colors.black,
                ),
              ),
              onTap: () {
                setState(() {
                  currentIndex = 2;
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => LandingPage()),
                    (route) => false,
                  );
                });
              },
            ),
          ],
        ),
      ),
      body: _screen[currentIndex],
    );
  }
}
