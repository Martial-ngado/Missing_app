import 'package:flutter/material.dart';

class facebook extends StatelessWidget {
  const facebook({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {

      },
      icon: Icon(Icons.facebook, color: Colors.blue.shade800,), // Facebook icon
      label: Text("Sign In with Facebook"),
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
