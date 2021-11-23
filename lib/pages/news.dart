import 'package:flutter/material.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_tts/flutter_tts.dart';


class NewsInfo extends StatefulWidget {
  @override
  _NewsInfoState createState() => _NewsInfoState();
}

class _NewsInfoState extends State<NewsInfo> {

  final FlutterTts flutterTts=FlutterTts();

  Map data1;
  Future<void> urll;
  bool Toggle=true;


  @override
  Widget build(BuildContext context) {

    speak(List a,int ind) async{
      if(Toggle){
        flutterTts.speak(a[ind]["title"]);
        flutterTts.setPitch(1);
      }
      else{
        flutterTts.stop();
      }
    }

    data1=ModalRoute.of(context).settings.arguments;
    List newsa=data1['info'];

  Future<void> launc(String urll) async{
    if(await canLaunch(urll)){
      await launch(urll,forceSafariVC: false,forceWebView: false, );
    }
    else{
      throw 'Could Not Launch$urll';
    }
  }


    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe up For Latest News"),
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.black,
      body: TikTokStyleFullPageScroller(

        contentSize: newsa.length,
        swipeThreshold: 0.01,
        // ^ the fraction of the screen needed to scroll
        swipeVelocityThreshold: 10,
        // ^ the velocity threshold for smaller scrolls
        animationDuration: const Duration(milliseconds: 300),
        // ^ how long the animation will take
        builder: (BuildContext context, int index) {

          return Padding(



            padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 8.0),

            child:
            Column(
              children: [
                Container(
                    width: 1000.00,
                    height: 330.00,

                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: NetworkImage('${newsa[index]['urlToImage']}'),
                        fit: BoxFit.cover,
                      ),
                    )
                ),
                Divider(
                  height: 10.0,
                  color: Colors.white,
                ),
                Container(


                  height: 120,
                  color: Colors.grey[900],

                  child:
                  Text(

                    '${newsa[index]['source']['name']}\n${newsa[index]['title']} ',

                    style: const TextStyle(height: 1.5,fontSize: 20, color: Colors.white,letterSpacing:1.0,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Divider(
                  height: 10.0,
                  color: Colors.white,
                ),

                SizedBox(height: 0,),

                Container(

                  height: 170,
                  color: Colors.grey[700],

                  child:
                  Text(

                    'DESCRIPTION: \n${newsa[index]['description']}'
                        '$index',
                    style: const TextStyle(height: 1.5,fontSize: 20, color: Colors.black,letterSpacing: 0.0,


                    ),
                  ),
                ),
                Divider(
                  height: 10.0,
                  color: Colors.white,
                ),

                SizedBox(height: 0,),
                Container(
                  height: 44,
                  width: 395,
                  color: Colors.grey[800],


                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton.icon(
                          onPressed: (){
                            speak(newsa,index);
                            setState(() {
                              Toggle=!Toggle;
                              }
                            );
                          },
                          icon: Icon(Icons.volume_up,color: Colors.white,),
                          label: Text("TO Listen",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                          )
                      ),
                      RaisedButton(
                        onPressed: (){
                          launc('${newsa[index]['url']}');

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
                            constraints: BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Text(
                              ""
                                  "To Know More..",
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
                    ],
                  ),

                )


              ],

            ),
          );
        },
      ),

    );
  }
}
