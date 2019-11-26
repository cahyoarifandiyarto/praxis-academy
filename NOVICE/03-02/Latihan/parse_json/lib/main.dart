import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Comment>> fetchComments(http.Client client) async {
  //response
  final response = await client.get('https://jsonplaceholder.typicode.com/comments');

  return compute(parseComments, response.body);

}

//Converts response body into a List<Comment>
List<Comment> parseComments(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Comment>((json) => Comment.fromJson(json)).toList();
}

class Comment {
  final int postId;
  final int id;
  final String email;
  final String name;
  final String body;

  Comment({this.postId, this.id, this.email, this.name, this.body});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      postId: json['postId'] as int,
      id: json['id'] as int,
      email: json['email'] as String,
      name: json['name'] as String,
      body: json['body'] as String,
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Isolate Demo';

    return MaterialApp(
      title: title,
      home: HomePage(title: title),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Comment>>(
        future: fetchComments(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData ? CommentList(comments: snapshot.data) : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class CommentList extends StatelessWidget {
  final List<Comment> comments;

  CommentList({Key key, this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: comments.length,
      itemBuilder: (context, index) {
        return Text(comments[index].email);
      }
    );
  }
}