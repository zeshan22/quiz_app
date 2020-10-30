import 'package:flutter/material.dart';
import 'package:quizer_app/helper/functions.dart';
import 'package:quizer_app/services/auth.dart';
import 'package:quizer_app/views/home.dart';
import 'package:quizer_app/views/signin.dart';
import 'package:quizer_app/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String email, pass, name;
  AuthService authService = new AuthService();

  bool _isLoading = false;
  signUp() {
    if (_formKey.currentState.validate()) {
      authService.signUpEmailAndPass(email, pass).then((value) => {
            if (value != null)
              {
                setState(() {
                  bool _isLoading = true;
                }),
                HelperFunctions.saveUserLoggedDetails(isLogged: true),
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    )),
              }
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appbar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body: _isLoading ? Container(
        child: CircularProgressIndicator(),
      ):Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: <Widget>[
              Spacer(),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "Enter name Id" : null;
                },
                decoration: InputDecoration(
                  hintText: "Name",
                ),
                onChanged: (val) {
                  name = val;
                },
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "Enter Name" : null;
                },
                decoration: InputDecoration(
                  hintText: "Email",
                ),
                onChanged: (val) {
                  email = val;
                },
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
                onChanged: (val) {
                  pass = val;
                },
              ),
              SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  signUp();
                },
                child: blueButton(context:context,label:"SignUp"),
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontSize: 15.5,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn(),
                            ));
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 15.5,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
