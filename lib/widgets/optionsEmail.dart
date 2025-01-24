import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class emailops extends StatelessWidget {
  const emailops({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // Add your onPress logic here for email sign in
      },
      icon: Icon(Icons.email,color: Colors.red.shade800,), // Email icon
      label: Text("Sign In with Email"),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        backgroundColor: Colors.white70, // Customize color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
      ),
    );
  }
}
