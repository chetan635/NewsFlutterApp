import 'package:flutter/material.dart';
import 'package:daily_news/pages/data.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';
import 'dart:ui';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void qwate() async{
    Data instance=Data();
    await instance.getdata();

    Navigator.pushNamed((context), '/news',arguments: {
      'info':instance.info,
    }


    );

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.amber[500],
        title: Text(
          'Welcome To daily News',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body:
        Column(
          children: [
            Container(
                width: 400.00,
                height: 620.00,

                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: AssetImage('lib/assects/news2.jfif'),
                    fit: BoxFit.cover,
                  ),
                )
            ),
            Divider(
              height: 20.0,
              color: Colors.white,
            ),
            Container(
              height: 50,
              width: 300,
              child: RaisedButton(
                onPressed: () {
                  qwate();
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Colors.amber, Colors.pink],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Latest News",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        )


    );

  }
}
