

import 'package:firebase_estudo/ui/loguinPage/repositories/firebaseRepositorie.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'file:///D:/MobileDeveloper/firebase_estudo/firebase_estudo/lib/ui/loguinPage/view/loguinPage.dart';
import 'ui/homePage/view/homePage.dart';
import 'package:provider/provider.dart';



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
      MultiProvider(
        providers: [
            Provider<FirebaseRepositorie>(create: (_)=>FirebaseRepositorie())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          routes: {
            "/":(context)=>SplatScreen(),
            '/loguin': (context)=>LoguinPage(),
            "/home":(context)=>HomePage()
          },
         // home: SplatScreen(),
        )),
      );




}


class SplatScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final stateLoguin = Provider.of<FirebaseRepositorie>(context);
    return FutureBuilder(
      future:stateLoguin.verifyUserLog(),
      builder:(context,snapshot){
        if( snapshot.connectionState==ConnectionState.waiting) {
          print(snapshot.data);
          return Scaffold(
              body:Container(
                  color: Colors.deepPurple)
          );
        }else if(snapshot.connectionState==ConnectionState.done){
          return snapshot.data==true ? HomePage():LoguinPage();
        }
        return Center(child: CircularProgressIndicator(),);
      }

    );
  }
}

