import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FirebaseRepositorie{

  FirebaseAuth _firebase =  FirebaseAuth.instance;
  Future<SharedPreferences> _local = SharedPreferences.getInstance();


  Future<bool> createUser(String email,String password) async{
    try {

      await _firebase.createUserWithEmailAndPassword(
          email: email, password: password);


      return true;

    }catch(e){
      return false;
    }
  }

  Future<bool> singInUser(String email,String password) async{
    try {

      await _firebase.signInWithEmailAndPassword(email: email, password: password);
      this._local.then((value) async => value.setString('id', await _firebase.currentUser.getIdToken()));

      return true;
    }catch(e){
      return false;
    }
  }

  Future<bool> verifyUserLog() async {

     return _firebase.currentUser==null ? false
         : _local.then((value) async =>  value.getString('id') == await _firebase.currentUser.getIdToken());


  }

  Future<void> singOutUser() async{

    await _firebase.signOut();

  }



}