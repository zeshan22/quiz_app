
import 'package:flutter/material.dart';
import 'package:quizer_app/widgets/widgets.dart';


class PlayQuiz extends StatefulWidget {

  final String quizId;

  PlayQuiz(this.quizId);


  @override
  _PlayQuizState createState() => _PlayQuizState();
}

class _PlayQuizState extends State<PlayQuiz> {

  @override
  void initState() {
    // TODO: implement initState
    print("${widget.quizId}");
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
        iconTheme: IconThemeData(
          color :Colors.black54
        ),
      ),
    );
  }
}
