import 'package:flutter/material.dart';


class OptionTile extends StatefulWidget {

  final String option, description, correctAns, optionSelected;

   OptionTile({this.option, this.description, this.correctAns, this.optionSelected});

  @override
  _OptionTileState createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(

            ),
            child: Text("${widget.option}",style: TextStyle(
              color: Colors.black54,
            ),),

          )
        ],
      ),
    );
  }
}
