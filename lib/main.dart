import 'package:flutter/material.dart';
import 'httpsrv.dart';
import 'reviewdetail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bootcamp Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Bootcamp Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<dynamic> ads = [];
  void _incrementCounter() {
    getadslist().then((value) => process(value));
  }

  void process(dt) {
    ads.clear();
    for (Map i in dt) {
      setState(() {
        ads.add(i);
      });
    }
  }

  @override
  void initState() {
    // 初始化数据
    //_retrieveIcons();
  }

  Widget gvbuild() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //每行三列
          childAspectRatio: 1.0, //显示区域宽高相等
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: ads.length,
        padding: EdgeInsets.all(10.0),
        itemBuilder: (context, index) {
          return InkWell(
            child: cell1(ads[index]),
            onTap: (){
              print(ads[index]['reviewsUrl']);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => reviewdetail(url: ads[index]['reviewsUrl'],),
                ),
              );
            },
          );
          // if (index == ads.length - 1 && ads.length < 200) {
          //   _retrieveIcons();
          // }
          //return cell1(ads[index]);
        });
  }

  Widget cell1(dt) {
    return Container(
        // decoration: BoxDecoration(
        //     border: Border.all(color: Colors.blueAccent)
        // ),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        color: Colors.lightBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text(
                  dt['title'],
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'price ' + dt['price'].toString() + ' ' + dt['currency'],
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  dt['contact'],
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            // Row(
            //   children: [
            //     Text(
            //       dt['contactRatingState']['average_rating'].toString(),
            //       style: TextStyle(color: Colors.white, fontSize: 20),
            //     ),
            //   ],
            // )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: gvbuild(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
