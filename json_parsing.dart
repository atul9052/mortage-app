import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Jsonparsingsimple extends StatefulWidget {
  @override
  _JsonparsingsimpleState createState() => _JsonparsingsimpleState();
}

class _JsonparsingsimpleState extends State<Jsonparsingsimple> {
  Future data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json Parsing"),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
              future: getData(),
              builder: (context, AsyncSnapshot snapshot){
                if(snapshot.hasData) {
                  return createlistview(snapshot.data,context);
                  //return Text(snapshot.data[6]['userId'].toString());
                }
                return CircularProgressIndicator();
              }
          ),
        ),
      ),
    );
  }

  Future getData() async {
    var data;
    String url = "http://jsonplaceholder.typicode.com/posts";
    Network network = Network(url);
    data = network.fetchdata();
    //data.then((value) {
    //print(value[0]['title']);
    //});

    return data;
  }

  Widget createlistview(List data, BuildContext context) {
    return Container(

      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context,int index){
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Divider(height: 5.0,),
          ListTile(

            title: Text("${data[index]["title"]}"),
            subtitle: Text("${data[index]["body"]}"),
            leading: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.black26,
                  radius: 23,
                  child: Text("${data[index]["id"]}",style: TextStyle(
                    color: Colors.black
                  ),),
                ),


              ],
            ),
          )
          ],
        );
    },
    )

    );
  }
}

class Network {
  final String url;

  Network(this.url);

  Future fetchdata() async {
    print("$url");
    Response response = await get(Uri.encodeFull(url));
    if (response.statusCode == 200) {
      //Ok
      //print(response.body[0]);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}