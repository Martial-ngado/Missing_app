import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String>  signUpUsers (String email,String username,String password,String phone) async{

    String res = 'Some error occured';
    try {
      if (email.isNotEmpty && username.isNotEmpty && phone.isNotEmpty && password.isNotEmpty ){


        //create the user if field are not empty

        UserCredential cred = await auth.createUserWithEmailAndPassword(email: email, password: password);

        res = 'Success';
      }else {
         res = 'please fields cannot be empty';
      }
    } catch (e){

    }
    return res;

  }
}