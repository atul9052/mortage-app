import 'dart:convert';
import 'package:mortage_app/model/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class jsonparsingmap extends StatefulWidget {
  @override
  _jsonparsingmapState createState() => _jsonparsingmapState();
}

class _jsonparsingmapState extends State<jsonparsingmap> {
  Future <PostList> data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Network network = Network("http://jsonplaceholder.typicode.com/posts");
    data = network.loadposts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("podo"),

      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
              future: data,
              builder: (context,AsyncSnapshot<PostList> snapshot){
            List<Post> allPosts;
            if(snapshot.hasData){
              allPosts = snapshot.data.posts;
              return Text("${allPosts[1].title}");
            }
            else{
              return CircularProgressIndicator();
            }

          }),
        ),

      ),
    );
  }
}

class Network {
  final String url;

  Network(this.url);

  Future<PostList> loadposts() async{
  final response= await get(Uri.encodeFull(url));
  if(response.statusCode == 200){
    return PostList.fromJson(json.decode(response.body));
  }
else{
  throw Exception("Failed to get ");
  }


  }
}