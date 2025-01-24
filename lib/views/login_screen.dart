import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:missing/sup_auth/auth.dart';
import 'package:missing/views/Navigation_sreen.dart';
import 'package:missing/views/registration.dart';
import 'package:missing/widgets/fbops.dart';
import 'package:missing/widgets/optionsEmail.dart';
import 'package:missing/widgets/passwordfield.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../const.dart';
import '../cubit/auth/auth_cubit.dart';
import '../cubit/credential/credential_cubit.dart';
import '../widgets/textfield.dart';
import 'package:missing/widgets/button.dart';

import 'main_screen.dart'; // Assuming your custom button widget is here

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //get auth services
   final authService = AuthServices();



  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  bool _isChecked = false;
  bool _obscureText = true;
  //To toggle password visibility
  bool _isSigningIn = false;


  void Login() async {
    final email = EmailController.text;
    final password = PasswordController.text;

    //attempt to login
    try {
      await authService.signInWithEmailPassword(email, password);

    }
    catch (e) {
      if (mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("error: $e")));
      }
    }
  }

  @override
  void dispose() {
    EmailController.dispose();
    PasswordController.dispose();
    super.dispose();
  }

  void _toggleCheckbox(bool? value) {
    setState(() {
      _isChecked = value!;
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText; // Toggle visibility
    });
  }

  @override
  Widget build(BuildContext context) {

      return Scaffold(
          backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 90.0, right: 0, left: 0),
              child: Container(
                padding: const EdgeInsets.only(top: 70, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.lock_clock_rounded,
                      color: Colors.blue.shade900,
                      size: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Text(
                        'Bienvenue!',
                        style: TextStyle(fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Email Textfield
                    Textfield(
                      onChanged: (String value) {},
                      controller: EmailController,
                      hintText: 'Adresse Email',
                      ObscureText: false,
                    ),
                    SizedBox(height: 10),
                    // Password Textfield
                    passwordfield(
                      onChanged: (String value) {},
                      controller: PasswordController,
                      hintText: 'Mot de Passe',
                      ObscureText: _obscureText,
                      suffixIcon: IconButton(
                        onPressed: _togglePasswordVisibility,
                        // Toggle password visibility
                        icon: Icon(
                          _obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                    ),
                    // Checkbox Row
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.blue.shade800,
                            value: _isChecked,
                            onChanged: _toggleCheckbox,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  2), // Rounded corners
                            ),
                          ),
                          Text(
                            'Remember me?',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                          Spacer(),
                          Text(
                            'Mot de Passe Oublié?',
                            style: TextStyle(color: Colors.red.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    // Button (Login with email)
                    GestureDetector(
                      onTap: () {
                        Login();
                      },
                      child: button(
                        buttonText: 'Se Connecter',
                      ),
                    ),

                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => Registration()));
                            },
                            child: Text(
                              'Creer mon Compte',
                              style: TextStyle(color: Colors.blue.shade800,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    // Sign In with Email ElevatedButton
                    emailops(),
                    SizedBox(height: 10),
                    // Sign In with Facebook ElevatedButton
                    facebook(),
                    SizedBox(height: 10),
                  ],
                ),
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.99,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),

      );

    }




}


