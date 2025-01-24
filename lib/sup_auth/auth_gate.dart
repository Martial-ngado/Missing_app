//this is gonna act like a gate to the content of the app
//if the user if authenticated it will show the main page of the app if not the user will remain on the login page

import 'package:flutter/material.dart';
import 'package:missing/views/User_profile_page.dart';
import 'package:missing/views/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class authgate extends StatelessWidget {
  const authgate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: (context, snapshot) {
          //loading....
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator(),),
            );
          }
             //check for valid session
          final session = snapshot.hasData? snapshot.data!.session : null;
          if (session != null){
            return const profile_page();

          } else {
            return const LoginScreen();
          }



        },
    );
  }
}
