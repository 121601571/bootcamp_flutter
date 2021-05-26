import 'package:flutter/material.dart';
import 'httpsrv.dart';

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
  reviewdetailState createState() => reviewdetailState( url );
}

class reviewdetailState extends State<reviewdetail> {
  reviewdetailState(this.url );
  final String url;



  List<dynamic> details = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    processdt(url);
  }

  Future processdt(url) async{
    var res = await getabrlink(url);
    print(res);
    setState(() {
      details.clear();
      details.addAll(res);
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews Detail'),
      ),
      body: listbody(),
    );
  }
  
  Widget listbody(){
    return ListView.builder(
      itemCount: details.length,
      itemBuilder: (context, index) {
        return new ListTile(
          leading: new Icon(Icons.person),
          title: new Text(details[index]['comment'], style: TextStyle(fontSize: 26),),

          subtitle: new Text('rating: '+details[index]['rating'].toString()),
         // trailing: new Text(details[index]['reviewer_email']),
        );
      },

    );
  }
  
}
