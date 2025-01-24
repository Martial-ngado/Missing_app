import 'package:flutter/material.dart';

class user_row extends StatefulWidget {
  const user_row({super.key});

  @override
  State<user_row> createState() => _user_rowState();
}

class _user_rowState extends State<user_row> {
  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(30.0),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello 👋',
              style: TextStyle(
                fontSize: 13,
                color: Colors.black, // Ensure text is visible on light background
              ),
            ),
            Text(
              'Martial Dessouza',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Dark text for good contrast
              ),
            ),
          ],
        ),
        Spacer(),
        FloatingActionButton(
          onPressed: () {},
          elevation: 6, // Add elevation for a better floating effect
          backgroundColor: Colors.blueGrey, // Set a background color for the FAB
          shape: CircleBorder(),
          child: ClipOval( // Wrap the image in ClipOval to ensure it fills the circular FAB
            child: Icon(Icons.notifications,color: Colors.white,)
          ),
        ),
        SizedBox(width: 10,),
        FloatingActionButton(
          onPressed: () {},
          elevation: 6, // Add elevation for a better floating effect
          backgroundColor: Colors.blue.shade800, // Set a background color for the FAB
          shape: CircleBorder(),
          child: ClipOval( // Wrap the image in ClipOval to ensure it fills the circular FAB
            child: Image.asset(
              'assets/images/me.jpeg',
              fit: BoxFit.cover, // Ensure the image covers the entire space
              width: 56, // You can adjust the size if needed
              height: 56, // Set the height equal to width for a perfect circle
            ),
          ),
        ),
        SizedBox(width: 12),
      ],
    ),
    );
  }
}
