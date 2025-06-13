import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const String id = "/info_aplikasi";
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 120,
                vertical: 30,
              ),
              child: Column(
                children: [
                  Icon(Icons.note_add_rounded, size: 80, color: Colors.black),
                  SizedBox(height: 20),
                  Text(
                    "Notes App",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoSection(
                    "About",
                    "A simple yet powerful note-taking application built with Flutter. Keep your thoughts organized and accessible anytime, anywhere.",
                    Icons.info_outline,
                  ),
                  SizedBox(height: 25),
                  _buildInfoSection(
                    "Features",
                    "• Create and edit notes\n• Search through your notes\n• Secure user authentication\n• Clean and intuitive interface",
                    Icons.star_outline,
                  ),
                  SizedBox(height: 25),
                  _buildInfoSection("Version", "1.0.0", Icons.update),
                  SizedBox(height: 25),
                  _buildInfoSection(
                    "Developer",
                    "Alfarezhi Mohamad Rasidan",
                    Icons.person_outline,
                  ),
                  SizedBox(height: 25),
                  _buildInfoSection(
                    "Contact",
                    "github.com/alfadevwork",
                    Icons.link,
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(String title, String content, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 24, color: Colors.black),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          content,
          style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
        ),
      ],
    );
  }
}
