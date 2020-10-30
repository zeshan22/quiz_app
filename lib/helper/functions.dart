
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions{

  static String USERLOGGEDKEY= "userLoggedInkey";

  static saveUserLoggedDetails({@required bool isLogged}) async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(USERLOGGEDKEY, isLogged);


  }
  static Future<bool> getUserLoggedDetails() async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.getBool(USERLOGGEDKEY);


  }

}