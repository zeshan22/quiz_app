

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quizer_app/model/UUSSER.dart';

class AuthService{

  FirebaseAuth _auth = FirebaseAuth.instance;

  UUSSEERR _userFromFirebase(User firebaseUser){
    return firebaseUser!= null ? UUSSEERR(uuID:firebaseUser.uid):null;

  }


  Future signInEmailAndPass(String email,String pass) async{

    try{
      UserCredential authResult  = await _auth.signInWithEmailAndPassword(email: email, password: pass);
      User user = authResult.user;
      return _userFromFirebase(user);
    }
    catch(e){
      print(e.toString());
    }

  }
  Future signUpEmailAndPass(String email,String pass) async{

    try{
      UserCredential authResult  = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      User user = authResult.user;
      return _userFromFirebase(user);
    }
    catch(e){
      print(e.toString());
    }

  }
  Future signOut() async{

    try{

      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }

  }

}