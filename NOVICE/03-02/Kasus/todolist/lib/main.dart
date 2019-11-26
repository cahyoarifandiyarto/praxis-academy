import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "List",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  List data;
  List<int> items = [];

  Future<String> getData() async {
    var res = await http.get(Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"), headers: {"Accept": "application/json"});

    this.setState(() {
      data = json.decode(res.body);
    });

    return "Success";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  void alertItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add ${data[index]["title"]} ?"),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('Add'),
              onPressed: () {
                addItem(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }

  addItem(int index) {
    if (!items.contains(index)) {
      items.add(index);
    }

    setState(() {
      items.sort((a, b) => a.compareTo(b));
    });
    print(items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List"), backgroundColor: Colors.orange, actions: [
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage(items: items))),
        ),
      ]),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          if (!items.contains(index)) {
            return Card(
              child: InkWell(
                onTap: () => alertItem(index),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(data[index]["title"], style: TextStyle(fontSize: 14.0)),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

class ListPage extends StatefulWidget {
  final List items;

  ListPage({Key key, this.items}) : super(key: key);

  @override
  ListPageState createState() => ListPageState();
}

class ListPageState extends State<ListPage> {
  List data, list, nowList;

  Future<String> getData() async {
    var res = await http.get(Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"), headers: {"Accept": "application/json"});

    this.setState(() {
      data = json.decode(res.body);
    });

    return "Success";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  void alertItem(int index, List item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remove ${data[index]["title"]} ?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop()
            ),
            FlatButton(
              child: Text('Remove'),
              onPressed: () {
                removeItem(index, item);
                Navigator.of(context).pop('String');
              },
            )
          ],
        );
      },
    );
  }

  removeItem(int index, List item) {
    setState(() {
      list = item;
      list.removeWhere((item) => item == index);
    });
    print(list);
  }

  @override
  Widget build(BuildContext context) {
    nowList = widget.items;
    list = nowList == [] ? list : nowList;
    nowList = [];

    return Scaffold(
      appBar: AppBar(title: Text("List Add"), backgroundColor: Colors.orange),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          if (list.contains(index)) {
            return Card(
              child: InkWell(
                onTap: () => alertItem(index, widget.items),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(data[index]["title"], style: TextStyle(fontSize: 14.0)),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}