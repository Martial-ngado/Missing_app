import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
final bool ObscureText;


  final ValueChanged<String>? onChanged;


  const Textfield({
    Key? key,
  required this.onChanged,

    required this.controller,
    required this.hintText,
    required this.ObscureText,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 3,top: 2),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          hintText: hintText,

          contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0), // Increased padding

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(17),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(30), // Rounded corners when focused
          ),

        ),
        onChanged: onChanged,
      ),
    );
  }
}