import 'dart:async';
import 'dart:io';
import 'dart:convert';

Future<void> getPost() async {
  var req = await HttpClient().getUrl(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  var res = await req.close();

  await for (var data in res.transform(Utf8Decoder())) {
    print(data);
    var file = 'post.txt';
    new File(file).writeAsString(data);
  }
}

void main() async {
  getPost();
}