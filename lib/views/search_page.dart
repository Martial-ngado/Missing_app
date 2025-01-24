import 'package:flutter/material.dart';
import 'package:missing/widgets/search_field.dart';

class search_page extends StatefulWidget {
  const search_page({super.key});

  @override
  State<search_page> createState() => _search_pageState();
}

class _search_pageState extends State<search_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ListView(
          children: [
                 SearchField(),
                 SizedBox(height: 10,),
                 GridView.builder(
                itemCount: 300,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      // Navigator.pushNamed(context, PageConst.postDetailPage, arguments: posts[index].postId);
                    },
                    child: Container(
                        width: 100,
                        height: 100,
                        child: Image.asset('assets/images/img_4.png',fit: BoxFit.cover,)
                    ),
                  );}
            ),

          ],
        ),
      ),
    );
  }
}
