import 'package:flutter/material.dart';
import 'package:missing/widgets/post_card.dart';
import 'package:missing/widgets/user_row.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}


class _NavScreenState extends State<NavScreen> {
  final numberOfPost = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Ensure the background is white for a light screen
      body: ListView(
        children: [
          user_row(),
          for (int i = 0; i < numberOfPost; i++) PostCard(),

        ],
      ),



    );
  }
}
