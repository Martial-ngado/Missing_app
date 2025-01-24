import 'package:flutter/material.dart';

class DescriptionField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final ValueChanged<String>? onChanged;

  const DescriptionField({
    Key? key,
    required this.onChanged,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 3, top: 2),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        maxLines: 5, // Allows the text field to be big enough for multiple lines
        keyboardType: TextInputType.multiline, // Ensures multi-line input is supported
        decoration: InputDecoration(
          fillColor: Colors.grey.shade50,
          filled: true,
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0), // Adjusted padding for better height

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(17),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0),
            borderRadius: BorderRadius.circular(0), // Rounded corners when focused
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
