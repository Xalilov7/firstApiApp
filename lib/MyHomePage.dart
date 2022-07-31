import 'dart:convert';
import 'package:api_first/models/cats.dart';
import 'package:flutter/material.dart';
import 'InfoPage.dart';
import 'models/posts.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Post? post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("DATA FROM API",
        style: TextStyle(
          color: Colors.green
        ),
        ),
      ),
      body: FutureBuilder(
        future: _getPostsFromApi(),
        builder: (context, AsyncSnapshot<List<Cats>> snap){
        var data = snap.data;
         if(snap.hasData){
           return ListView.builder(
               itemBuilder:  (context, index) => ListTile(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPage(
                 data![index].imageUrl.toString(),
                  data[index].statusCode.toString(),
                   data[index].description.toString(),
                 ),
                 ),
                 );
               },
               title: Container(
                 height: 300,
                 child: Image.network(data![index].imageUrl.toString()),
               ),
               subtitle: Text(data[index].description .toString(),textAlign: TextAlign.center,
               style: TextStyle(
                 fontSize: 30,
               ),
               ),
               ),
             itemCount: data!.length,
           );
         }else{
           return Center(
             child: CircularProgressIndicator(),
           );
         }
        },
      ),
    );
  }





  Future<List<Cats>> _getPostsFromApi() async{
    var _res = await http.get(Uri.parse("https://hwasampleapi.firebaseio.com/http.json"));
    if(_res.statusCode == 200){
      return  (json.decode(_res.body) as List).map((e) => Cats.fromJson(e)).toList();
    }else{
      throw Exception("Error");
    }
  }
}
