import 'package:flutter/material.dart';
import 'package:missing/views/login_screen.dart';
import 'package:missing/widgets/fbops.dart';
import 'package:missing/widgets/optionsEmail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../Controllers/auth_controller.dart';
import '../Entitie/user_entity.dart';
import '../const.dart';
import '../cubit/auth/auth_cubit.dart';
import '../cubit/credential/credential_cubit.dart';
import '../sup_auth/auth.dart';
import '../widgets/textfield.dart';
import 'package:missing/widgets/button.dart';


class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final authService = AuthServices();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();


  bool _isChecked = false;


  void saveUserInfo() async {
    // Get the actual values from the controllers
    final name = nameController.text;
    final email = EmailController.text;
    final phone = phoneController.text;

    await Supabase.instance.client.from('users').insert({'user_name': nameController.text});

    // Check if any field is empty (basic validation)
    if (name.isEmpty || email.isEmpty || phone.isEmpty) {
      print("Please fill all fields.");
      return;
    }



  }

  @override
  void dispose() {
    EmailController.dispose();
    PasswordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> signUp() async {
    final email = EmailController.text;
    final password = PasswordController.text;
    final name = nameController.text;
    final phone = phoneController.text;

    // Attempt to sign up
    try {
      await authService.signUpWithEmailPassword(email, password,);
      Navigator.pop(context); // Navigate back after successful signup
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    }
  }

  void _toggleCheckbox(bool? value) {
    setState(() {
      _isChecked = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),  // Padding for the sides
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 90),
              Icon(Icons.lock_clock_rounded, color: Colors.blue.shade900, size: 80),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  'Bienvenue!',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              SizedBox(height: 10),

              // Name Textfield
              Textfield(
                onChanged: (String value) {},
                controller: nameController,
                hintText: 'Nom & Prenom',
                ObscureText: false,
              ),
              SizedBox(height: 6),

              // Phone Textfield
              Textfield(
                onChanged: (String value) {},
                controller: phoneController,
                hintText: 'Numéro de Téléphone',
                ObscureText: false,
              ),
              SizedBox(height: 6),

              // Email Textfield
              Textfield(
                onChanged: (String value) {},
                controller: EmailController,
                hintText: 'Adresse Email',
                ObscureText: false,
              ),
              SizedBox(height: 6),

              // Password Textfield
              Textfield(
                onChanged: (String value) {},
                controller: PasswordController,
                hintText: 'Mot de Passe',
                ObscureText: true,
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
                        borderRadius: BorderRadius.circular(2), // Rounded corners
                      ),
                    ),
                    Text(
                      'Remember me?',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        'J\'ai déjà un Compte',
                        style: TextStyle(color: Colors.red.shade800, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // Sign Up Button
              GestureDetector(
                onTap: () {

                  signUp();
                },
                child: button(
                  buttonText: 'Creer Mon Compte',
                ),
              ),
              SizedBox(height: 20),

              // Options for Email and Facebook
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: emailops(),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: facebook(),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
