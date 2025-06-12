import 'package:Notes/database/db_helper.dart';
import 'package:Notes/model/user_model.dart';
import 'package:Notes/utils/custom_elevated_button.dart';
import 'package:Notes/utils/custom_form_text_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String id = "/register_screen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isVisible = false;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Form(
        key: _formkey,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomFormTextField(
                  controller: emailController,
                  label: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Wajib diisi';
                    } else if (!value.contains('@') ||
                        !value.contains('gmail.com')) {
                      return 'Format email tidak valid \nFormat email menggunakan "email"@gmail.com';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                CustomFormTextField(
                  controller: usernameController,
                  label: 'Username',
                  validator: (value) =>
                      value == null || value.isEmpty ? "Wajib diisi" : null,
                ),
                SizedBox(height: 16),
                CustomFormTextField(
                  controller: passwordController,
                  label: 'Password',
                  validator: (value) =>
                      value == null || value.isEmpty ? "Wajib diisi" : null,
                  obscureText: !_isVisible,
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
                ),
                SizedBox(height: 16),
                CustomElevatedButton(
                  text: 'Register',
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      DbHelper.registerUser(
                        data: UserModel(
                          username: usernameController.text,
                          password: passwordController.text,
                          email: emailController.text,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 2 ),
                          content: Text('Registration Succesful!'),
                          backgroundColor: Colors.black,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
