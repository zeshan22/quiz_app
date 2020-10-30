import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quizer_app/helper/functions.dart';
import 'package:quizer_app/views/home.dart';
import 'package:quizer_app/views/signin.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool _isLogIn = false;

  @override
  void initState() {
    checkUserLogInStatus();
    // TODO: implement initState
    super.initState();
  }


  checkUserLogInStatus() async {
    HelperFunctions.getUserLoggedDetails().then((value) =>
    {
      setState((){
        _isLogIn = value;

      }),
    }
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: (_isLogIn ?? false) ? Home():SignIn(),
    );
  }
}
