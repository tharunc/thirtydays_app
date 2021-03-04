import 'package:flutter/material.dart';
import 'package:thirtydays_app/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name = "";

  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async{

    if(_formKey.currentState.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);

      setState(() {
        changeButton = false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,

          child: Column(
            children: <Widget>[
              Image.asset('assets/images/login.png', fit: BoxFit.fill,),
              SizedBox(
                height: 20.0,
              ),
              Text('Welcome $name',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 36.0 ),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter Username',
                          labelText: 'Username'),
                      validator: (String value){
                        if(value.isEmpty){
                          return 'Username cannot be Empty';
                        }
                        return null;
                      },
                      onChanged: (value){
                        name = value;

                        setState(() {

                        });
                      },
                    ),

                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        labelText: 'Password',
                      ),
                      validator: (value){
                        // ignore: missing_return
                        if(value.isEmpty){
                          return 'Enter Password';
                        }
                        else if(value.length < 6){
                          return 'Password Length must be greater than 6';
                        }

                      }
                    ),

                    SizedBox(
                      height: 30.0,
                    ),

                    Material(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(

                        onTap: () => moveToHome(context),

                        child: AnimatedContainer(

                          duration: Duration(seconds: 1),

                          width: 100 ,
                          height: 50,

                          // color: Color(0xFF9085A4),
                          alignment: Alignment.center,
                          child: changeButton?Icon(Icons.done, color: Colors.green,): Text(
                            'LOGIN',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
                            ),
                          ),

                        ),
                      ),
                    )
                    // ButtonTheme(
                    //   height: 50.0,
                    //   child: RaisedButton(
                    //     textColor: Colors.black,
                    //     child: Text('Login',
                    //     style: TextStyle(fontSize: 15.0,letterSpacing: 2.0,fontWeight: FontWeight.bold),),
                    //     color: Colors.deepPurple[50],
                    //     onPressed: (){
                    //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //     },
                    //   ),
                    // )
                  ],
                ),
              )




            ],

          ),
        ),
      )
    );
  }
}
