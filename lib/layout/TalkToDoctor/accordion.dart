import 'package:flutter/material.dart';

class Accordion extends StatefulWidget {
  final String title;
  final String content;

  Accordion(this.title, this.content);
  @override
  _AccordionState createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  bool _showContent = false;
  @override
  Widget build(BuildContext context) {
    return Card(
       margin: EdgeInsets.all(10),
      child: Column(children: [
        ListTile(
          title: Text(widget.title ,
            style: TextStyle(fontWeight: FontWeight.w500),),
          trailing: IconButton(
            icon: Icon(
                _showContent ?  Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded  ,
              color: Colors.orange, size: 30,),
            onPressed: () {
              setState(() {
                _showContent = !_showContent;
              });
            },
          ),
        ),
        _showContent
            ? Container(
           padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
           child:
          Text(widget.content , style: TextStyle(color: Colors.grey),),
        )
            : Container()
      ]),
    );
  }
}