import 'package:firebase_estudo/ui/loguinPage/controller/loguinController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoguinPage extends StatefulWidget {
  @override
  _LoguinPageState createState() => _LoguinPageState();
}

class _LoguinPageState extends State<LoguinPage> {

  final LoguinController _loguinControl = LoguinController ();

   @override
  void initState() {
    // TODO: implement initState
     _loguinControl.emailLoguin = TextEditingController();
     _loguinControl.passLoguin  = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _loguinControl.emailLoguin.dispose();
    _loguinControl.passLoguin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final W = MediaQuery.of(context).size.width;
    final H=  MediaQuery.of(context).size.height;
    return Scaffold(
      body:Stack(
        children: [
          Container(
          width: W,
          height: H,
          padding: EdgeInsets.all(W*0.07),
          decoration: BoxDecoration(
              color: Color(0xff26363E)
            ),
          ),
          SingleChildScrollView(
            child: Container(
              width: W,
              height: H,
              padding: EdgeInsets.all(W*0.07),
              decoration: BoxDecoration(
                  color: Color(0xff26363E)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Bem Vindo',
                    style: TextStyle(
                        color:  Color(0xffD8D8D8),
                        fontSize: H*0.05,
                        fontWeight: FontWeight.bold
                    ),),
                  Padding(
                    padding: EdgeInsets.only(top:H*0.03 ),
                    child: SizedBox(
                      height: H*0.09,
                      child: TextField(


                        controller: _loguinControl.emailLoguin,
                        cursorColor: Colors.black12,
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            enabled: true,
                            enabledBorder:OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:  Color(0xff7C98A9),//(0xffF4F4F4),
                                    width: W*0.004
                                )
                            ) ,
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Color(0xffD8D8D8),
                            labelText: 'email',
                            icon: Icon(Icons.email,
                              color: Color(0xffD8D8D8),
                            )
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:H*0.03,bottom: H*0.02 ),
                    child: SizedBox(
                      height: H*0.09,
                      child: TextField(
                        controller: _loguinControl.passLoguin,
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        cursorColor: Colors.black12,

                        decoration: InputDecoration(

                            enabled: true,
                            enabledBorder:OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:  Color(0xff7C98A9),//(0xffF4F4F4),
                                    width: W*0.004
                                )
                            ) ,
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Color(0xffD8D8D8),
                            labelText: 'password',

                            icon: Icon(Icons.lock,
                              color: Color(0xffD8D8D8),
                            )
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: W*0.26,
                        height: H*0.09,
                        decoration: BoxDecoration(
                            color: Color(0xff004FA2),
                            borderRadius: BorderRadius.circular(W*0.01)
                        ),
                        child: FlatButton(onPressed: ()async{


                          if(await _loguinControl.singIn()){

                            Navigator.pushReplacementNamed(context,'/home');

                          }else{
                              print('erro ao logar');
                          }

                        },
                          //padding: EdgeInsets.zero,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  'entrar'
                              ),
                            ],
                          ),

                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:W*0.10),
                        child: Container(
                          width: W*0.26,
                          height: H*0.09,
                          decoration: BoxDecoration(
                              color: Color(0xff004FA2),
                              borderRadius: BorderRadius.circular(W*0.01)
                          ),
                          child: FlatButton(onPressed:  ()async{
                            if(await _loguinControl.createUser()){

                              print('usuario criado');

                            }else{
                              print('erro ao criar user');
                            }



                          },

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    'cadastrar'
                                ),
                              ],
                            ),

                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ],
      )
      
    );
  }
}

