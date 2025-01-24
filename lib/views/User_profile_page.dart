import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:missing/sup_auth/auth.dart';

import '../Entitie/user_entity.dart';
import '../const.dart';
import '../cubit/auth/auth_cubit.dart';

class profile_page extends StatefulWidget {
  const profile_page({super.key});

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {

  final AuthService = AuthServices();


  //logout
  void logout() async{
    await AuthService.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: SingleChildScrollView(
            child: Column(
            //  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){
                        logout();
                      },
                        child: Icon(Icons.logout,color: Colors.black,size: 20,)),
                    Spacer(),
                    InkWell(
                      onTap: (){
                        _openBottomModalSheet(context: context, );
                      },
                        child: Icon(Icons.more_vert,color: Colors.black,size: 20,)
                    ) ,
                  ],
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/me.jpeg'),

                ),
                SizedBox(height: 10,),
                Text('Martial Dessouza N\Gado',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
                Text('guymartialngado@gmail.com | 0173515507',style: TextStyle(color: Colors.grey,fontSize: 13),),
                SizedBox(height: 10,),
                ElevatedButton(

                    onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade500, // Background color of the button
                     // Text color
                  ),
                    child: Text('Modifier mon profile',style: TextStyle(color: Colors.white),),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: GridView.builder(
                     itemCount: 10,
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
                          child: Image.asset('assets/images/img_2.png',fit: BoxFit.cover,)
                        ),
                        );}
                  ),
                ),
              ],
            ),
          ),
        ),

    );

  }
  _openBottomModalSheet({required BuildContext context, }) {
    return showModalBottomSheet(context: context, builder: (context) {
      return Container(
        height: 150,
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "More Options",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      //Navigator.pushNamed(context, PageConst.editProfilePage, arguments: currentUser);
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
                    },
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),
                sizeVer(7),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                sizeVer(7),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: InkWell(
                    onTap: () {
                      BlocProvider.of<AuthCubit>(context).loggedOut();
                     // Navigator.pushNamedAndRemoveUntil(context, PageConst.signInPage, (route) => false);
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),
                sizeVer(7),
              ],
            ),
          ),
        ),
      );
    });
}
}
