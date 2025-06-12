import 'package:Notes/pages/login_page.dart';
import 'package:Notes/pages/register_page.dart';
import 'package:Notes/utils/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  static const String id = "/landing_page";
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Center(
              child:
                  // Image.asset('assets/images/image.png')
                  Icon(Icons.note_add, size: 120),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  CustomElevatedButton(
                    text: 'Login',
                    textColor: Colors.white,
                    backgroundColor: Colors.black,
                    onPressed: () {
                      Navigator.pushNamed(context, LoginPage.id);
                    },
                  ),
                  CustomElevatedButton(
                    text: 'Register',
                    textColor: Colors.white,
                    backgroundColor: Colors.black,
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterPage.id);
                    },
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
