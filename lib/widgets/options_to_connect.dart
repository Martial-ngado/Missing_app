import 'dart:io';
import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  final String buttonText;
  final File imageOption;

  const Options({super.key, required this.buttonText, required this.imageOption});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            // Display the image from the file
            Image.file(
              imageOption, // You can use File(imageOption) here
              width: 30,  // Adjust the size of the image as needed
              height: 30, // Adjust the size of the image as needed
            ),
            SizedBox(width: 10),  // Space between the image and the text
            Text(buttonText, style: TextStyle(fontSize: 16, color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
