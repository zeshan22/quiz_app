import 'package:flutter/material.dart';
import 'package:quizer_app/helper/functions.dart';
import 'package:quizer_app/services/auth.dart';
import 'package:quizer_app/views/home.dart';
import 'package:quizer_app/views/signup.dart';
import 'package:quizer_app/widgets/widgets.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String email, pass;

  bool _isLoading = false;

  AuthService authService = new AuthService();

  signIn() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService.signInEmailAndPass(email, pass).then((value) => {
            if (value != null)
              {
                setState(() {
                  _isLoading = false;
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
      body: _isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    TextFormField(
                      validator: (val) {
                        return val.isEmpty ? "Enter Email id" : null;
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
                        signIn();
                      },
                      child:blueButton(context:context,label:"SignIn"),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don't have account? ",
                          style: TextStyle(
                            fontSize: 15.5,
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUp(),
                                  ));
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 15.5,
                                  decoration: TextDecoration.underline),
                            )),
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
