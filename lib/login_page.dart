import 'package:app_notes/database/db_helper.dart';
import 'package:app_notes/helper/preference.dart';
import 'package:app_notes/home.dart';
import 'package:app_notes/utils/custom_elevated_button.dart';
import 'package:app_notes/utils/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String id = "/login_page";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isVisible = false;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Form(
        key: _formkey,
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    controller: usernameController,
                    label: 'Username',
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                      icon: Icon(
                        _isVisible ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    obscureText: !_isVisible,
                    controller: passwordController,
                    label: 'Password',
                  ),
                  SizedBox(height: 16),
                  CustomElevatedButton(
                    text: 'Login',
                    textColor: Colors.white,
                    backgroundColor: Colors.black,
                    onPressed: () async {
                      final userData = await DbHelper.login(
                        usernameController.text,
                        passwordController.text,
                      );
                      if (userData != null) {
                        PreferenceHandler.saveLogin(true);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login Succesful')),
                        );
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => HomeScreen()),
                          (Route<dynamic> route) => false,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Username atau password salah'),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
