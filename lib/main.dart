import 'package:flutter/material.dart';
import 'package:daily_news/pages//news.dart';
import 'package:daily_news/pages/home.dart';

void main() =>runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/home':(context)=>Home(),
    '/news':(context)=>NewsInfo()
  },
));

