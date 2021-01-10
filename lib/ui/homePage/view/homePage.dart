import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.deepPurple,
        child: Center(
          child: FlatButton(
            color: Colors.white54,
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/');
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
