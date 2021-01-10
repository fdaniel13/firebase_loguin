import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FirebaseRepositorie{



  Future<bool> createUser(String email,String password) async{
    try {
      FirebaseAuth fireLog =  FirebaseAuth.instance;
      await fireLog.createUserWithEmailAndPassword(
          email: email, password: password);

      return true;

    }catch(e){
      return false;
    }
  }

  Future<bool> singInUser(String email,String password) async{
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    }catch(e){
      return false;
    }
  }

}