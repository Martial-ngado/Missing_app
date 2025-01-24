import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final String buttonText;
  const button({super.key, required this.buttonText, });

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.blue.shade900,
              borderRadius: BorderRadius.circular(8)

        ),
        child: Center(
          child: Text(buttonText,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)

        ),
      );

  }
}
