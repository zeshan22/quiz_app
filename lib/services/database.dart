
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{


  Future<void> addQuizData(Map quizData,String quizId) async {

   await FirebaseFirestore.instance.collection("Quiz").doc(quizId).set(quizData).catchError((e){
     print(e);
   });
  }


  Future<void> addQuestionData(Map questionData,String quizId) async {

    await FirebaseFirestore.instance.collection("Quiz").doc(quizId)
        .collection("Qna").add(questionData)
        .catchError((e){
      print(e);
    });
  }

  getQuizData() async {

    return await FirebaseFirestore.instance.collection("Quiz")
        .snapshots();

  }

  getQuizQuestion(String quizId) async{

    return await FirebaseFirestore.instance.collection("Quiz")
        .doc(quizId).collection('Qna').get();
  }

}