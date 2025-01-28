import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpStudy06 extends StatefulWidget {
  const HttpStudy06({super.key});

  @override
  _HttpStudy06State createState() => _HttpStudy06State();
}

class _HttpStudy06State extends State<HttpStudy06> {
  var resultGet = '';
  var resultPost = '';
  var resultPostJson = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Http学习"),
        ),
        body: Column(
          children: [
            _doGetBtn(),
            const Text("Get:\n", style: TextStyle(fontSize: 20)),
            Text(resultGet),
            _doPostBtn(),
            const Text("Post:\n", style: TextStyle(fontSize: 20)),
            Text(resultPost),
            _doPostJsonBtn(),
            const Text("PostJson:\n", style: TextStyle(fontSize: 20)),
            Text(resultPostJson),
          ],
        ),
      ),
    );
  }

  _doGetBtn() {
    return ElevatedButton(onPressed: _doGet, child: const Text('Get按钮'));
  }

  _doPostBtn() {
    return ElevatedButton(onPressed: _doPost, child: const Text('Post按钮'));
  }

  _doPostJsonBtn() {
    return ElevatedButton(
        onPressed: _doPostJson, child: const Text('PostJson按钮'));
  }

  _doGet() async {
    var url =
        Uri.parse('https://api.geekailab.com/uapi/test/test?requestPrams=11');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        resultGet = "请求成功。${response.body}";
      });
    } else {
      setState(() {
        resultGet = "请求失败。${response.body}";
      });
    }
  }

  _doPost() async {
    var url = Uri.parse('https://api.geekailab.com/uapi/test/test');
    var params = {"requestPrams": "doPost"};
    var response = await http.post(url, body: params);
    if (response.statusCode == 200) {
      setState(() {
        resultPost = "请求成功。${response.body}";
      });
    } else {
      setState(() {
        resultPost = "请求失败。${response.body}";
      });
    }
  }

  _doPostJson() async {
    var url = Uri.parse('https://api.geekailab.com/uapi/test/testJson');
    var params = {"requestPrams": "doPost"};
    var response = await http.post(
      url,
      body: jsonEncode(params),
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      setState(() {
        resultPostJson = "请求成功。${response.body}";
      });
    } else {
      setState(() {
        resultPostJson = "请求失败。${response.body}";
      });
    }
  }
}

// var uri = Uri.parse('https://api.geekailab.com/uapi/test/test');
// var uri = Uri.parse('https://api.geekailab.com/uapi/test/testJson');
// var uri =
//     Uri.parse('https://api.geekailab.com/uapi/test/test?requestPrams=11');
