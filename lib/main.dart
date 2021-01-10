

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'file:///D:/MobileDeveloper/firebase_estudo/firebase_estudo/lib/ui/loguinPage/view/loguinPage.dart';
import 'ui/homePage/view/homePage.dart';




void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/":(context)=>LoguinPage(),
      "/home":(context)=>HomePage()
    },
    //home: LoguinPage(),
  ));
}

