import 'package:flutter/material.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class Home extends StatefulWidget {
  final String title;

  const Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SkeletonLoader(
          builder: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 10,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 12,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          items: 5,
          period: Duration(seconds: 2),
          hightlightColor: Colors.lightBlue[300],
        ),
      ),
    );
  }
}
