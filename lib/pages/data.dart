import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class Data{
  List info;



    Data();


  Future<void> getdata()async{
    Response response =await get('http://newsapi.org/v2/top-headlines?country=in&apiKey=a6213e0b604c4cf8b11a837dea17ee0f');
    Map  data=jsonDecode(response.body);
    print(data);
    info=data["articles"];
    print(info);






  }

}