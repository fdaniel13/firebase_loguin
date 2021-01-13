
import 'package:firebase_estudo/ui/loguinPage/repositories/firebaseRepositorie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stateLoguin = Provider.of<FirebaseRepositorie>(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.deepPurple,
        child: Center(
          child: FlatButton(
            color: Colors.white54,
            onPressed: ()async{
              stateLoguin.singOutUser();
              Navigator.pushReplacementNamed(context, '/loguin');
            },
            child: Text(
              'Pagina inicial'
            ),
          ),
        ),
      ),
    );
  }
}
