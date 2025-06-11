import 'package:flutter/material.dart';

class AboutPageScreen extends StatelessWidget {
  static const String id = "/info_aplikasi";
  const AboutPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32),
            Text(
              "testing",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            SizedBox(height: 20),
            Text(
              "Dibuat oleh: Alfarezhi Mohamad Rasidan",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Versi : 1.0",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
