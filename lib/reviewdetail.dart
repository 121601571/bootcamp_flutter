import 'package:flutter/material.dart';


class reviewdetail extends StatefulWidget {
  final String  url;
  reviewdetail({Key key,  this.url, this.title}): super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  reviewdetailState createState() => reviewdetailState();
}

class reviewdetailState extends State<reviewdetail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews...'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(''),
      ),
    );
  }
  
}
