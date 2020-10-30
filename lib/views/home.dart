import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quizer_app/services/database.dart';
import 'package:quizer_app/views/create_quiz.dart';
import 'package:quizer_app/views/playQuiz.dart';
import 'package:quizer_app/widgets/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Stream quizStream;


  DatabaseService databaseService = new DatabaseService();

  Widget quizList(){
    return Container(
      child: StreamBuilder(
        stream: quizStream,
        builder: (context,snapshot){
          return snapshot.data == null ? Container():
              ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context,index){
                  return QuizTile(imgUrl: snapshot.data.docs[index].data()['quizImgUrl'],
                      title: snapshot.data.docs[index].data()['quizTitle'],
                      desc:snapshot.data.docs[index].data()['quizDesc'],
                    quizId:snapshot.data.docs[index].data()['quizId'],
                  );
                });
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    databaseService.getQuizData().then((val){
      setState(() {
        quizStream = val;
      });
    });
    super.initState();
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
      body: quizList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => CreateQuiz(),
          ));
        },
      ),
    );
  }
}

class QuizTile extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String desc;
  final String quizId;


  QuizTile({@required this.imgUrl,@required this.title,@required this.desc,@required this.quizId});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => PlayQuiz(
            quizId
          ),
        ));
      },

      child: Container(

        margin: EdgeInsets.only(bottom: 8),
        height: 150,

        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
            ),
            Image.network(imgUrl,width: MediaQuery.of(context).size.width-48,fit: BoxFit.cover),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black26,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
                  Text(desc,style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}
