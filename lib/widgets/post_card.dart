import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  // this function help display the image in full screen when the image is pressed
  void _showImage(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent, // Transparent background
          child: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop(); // Close dialog when tapped
              },
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width * 0.8, // Width 80% of screen width
                height: MediaQuery.of(context).size.height * 0.6, // Height 60% of screen height
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 1),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.58,
        child: Card(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
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
                    SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Martial NGADO', style: TextStyle(fontWeight: FontWeight.bold),),
                        Text('2 Hours ago', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),)
                      ],
                    ),
                    Spacer(),
                    FloatingActionButton(
                      onPressed: () {},
                      elevation: 6, // Add elevation for a better floating effect
                      backgroundColor: Colors.blue.shade50,
                      shape: CircleBorder(),
                      child: ClipOval(
                        child: Icon(Icons.more_vert),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Coucou Famille, SVP nous recherchons notre petite soeur disparue depuis deux jours. \n elle a quitte la maison le jeudi et depuis lors introuvable.',
                  maxLines: 4,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  // Image 1
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: GestureDetector(
                      onTap: () {
                        // Show the full screen image on tap
                        _showImage(context, 'assets/images/img_2.png');
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.20,
                        width: MediaQuery.of(context).size.height * 0.20,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/img_2.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Image 2
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: GestureDetector(
                      onTap: () {
                        // Show the full screen image on tap
                        _showImage(context, 'assets/images/img_2.png');
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.20,
                        width: MediaQuery.of(context).size.height * 0.20,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/img_2.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
             SizedBox(height: 10,),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
               height: MediaQuery.of(context).size.height * 0.08,

                 decoration: BoxDecoration(
                   color: Colors.grey.shade200,
                   borderRadius: BorderRadius.circular(20)
                 ),
                 child: Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: Row(
                     children: [
                       Icon(Icons.comment,color: Colors.blue,),
                       SizedBox(width: 10,),
                       Text('1234',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                       Spacer(),
                       Icon(Icons.share,color: Colors.green,)
                     ],

                   ),
                 ),
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
