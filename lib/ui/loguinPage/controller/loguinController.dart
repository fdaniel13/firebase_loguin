
import 'package:firebase_estudo/ui/loguinPage/repositories/firebaseRepositorie.dart';
import 'package:flutter/cupertino.dart';

class LoguinController{

    TextEditingController email;
    TextEditingController password;


    LoguinController({this.email,this.password});

    TextEditingController get emailLoguin => this.email;
    TextEditingController get passLoguin =>this.password;

    set emailLoguin (TextEditingController email) => this.email=email;
    set passLoguin (TextEditingController pass) =>this.password=pass;

    Future<bool> createUser() async{
        bool sucess= await FirebaseRepositorie().createUser(this.email.text,this.password.text);
        this.email.clear();
        this.password.clear();
        return sucess;


    }

    Future<bool> singIn() async{

        bool sucess= await FirebaseRepositorie().singInUser(this.email.text,this.password.text);
        this.email.clear();
        this.password.clear();
        print(await FirebaseRepositorie().verifyUserLog());
        return sucess;

    }

}