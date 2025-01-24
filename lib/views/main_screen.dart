import 'package:flutter/material.dart';
import 'package:missing/views/Navigation_sreen.dart';
import 'package:missing/views/search_page.dart';
import 'package:missing/views/upload_post_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'User_profile_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0; // This variable will control the selected page
  final List<Widget> _pages = [
    NavScreen(),
    search_page(),
    UploadPostPage(),
    profile_page(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_pageIndex], // Display the selected page

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0,left: 20,right: 20.0), // Add horizontal padding
        child: Container(

          decoration: BoxDecoration(
            color: Colors.blueGrey, // Background color of the bottom navigation bar
            borderRadius: BorderRadius.circular(30), // Rounded corners
            // Optional shadow for floating effect
          ),
          child: SalomonBottomBar(
            currentIndex: _pageIndex,
            onTap: (value) {
              setState(() {
                _pageIndex = value; // Update the page index when a tab is selected
              });
            },
            items: [
              // Home Tab
              SalomonBottomBarItem(
                icon: Icon(Icons.home,color: Colors.white,),
                title: Text("Home"),
                selectedColor: Colors.blue,
              ),
              // Post Tab
              SalomonBottomBarItem(
                icon: Icon(Icons.search,color: Colors.white,),
                title: Text("Search"),
                unselectedColor: Colors.grey,
                selectedColor: Colors.pink,
              ),
              // Search Tab
              SalomonBottomBarItem(
                icon: Icon(Icons.upload,color: Colors.white,),
                title: Text("Post"),
                unselectedColor: Colors.grey,
                selectedColor: Colors.orange,
              ),
              // Profile Tab
              SalomonBottomBarItem(
                icon: Icon(Icons.person,color: Colors.white,),
                title: Text("Profile"),
                unselectedColor: Colors.grey,
                selectedColor: Colors.teal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
