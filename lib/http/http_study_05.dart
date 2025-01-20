import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpStudy05 extends StatefulWidget {
  const HttpStudy05({super.key});

  @override
  State<HttpStudy05> createState() => _HttpStudy05State();
}

class _HttpStudy05State extends State<HttpStudy05> {
  var resultGet = "";
  var resultPost = "";
  var resultPostJson = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
        appBar: AppBar(title: const Text("Http测试05")),
        body: Column(
          children: [
            _doGetBtn(),
            _doPostBtn(),
            _doPostJsonBtn(),
            Text("Get:\n$resultGet\n", style: const TextStyle(fontSize: 20)),
            Text("Post:\n$resultPost\n", style: const TextStyle(fontSize: 20)),
            Text("PostJson:\n$resultPostJson\n",
                style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }

  _doGetBtn() {
    return ElevatedButton(onPressed: _doGet, child: const Text("Get"));
  }

  _doPostBtn() {
    return ElevatedButton(onPressed: _doPost, child: const Text("Post"));
  }

  _doPostJsonBtn() {
    return ElevatedButton(
        onPressed: _doPostJson, child: const Text("PostJson"));
  }

  _doGet() async {
    var url =
        Uri.parse('https://api.geekailab.com/uapi/test/test?requestPrams=11');
    var response = await http.get(url);
    _doResult(response, "get");
  }

  _doPost() async {
    var url = Uri.parse('https://api.geekailab.com/uapi/test/test');
    var params = {"requestPrams": "doPost"};
    var response = await http.post(url, body: params);
    _doResult(response, "post");
  }

  _doPostJson() async {
    var url = Uri.parse('https://api.geekailab.com/uapi/test/testJson');
    var params = {"requestPrams": "doPost"};
    var response = await http.post(
      url,
      body: jsonEncode(params),
      headers: {"content-type": "application/json"},
    );
    _doResult(response, "postJson");
  }

  _doResult(http.Response response, String type) {
    if (response.statusCode == 200) {
      setState(() {
        if (type == "get") {
          resultGet = "请求成功。\n${response.body}";
        } else if (type == "post") {
          resultPost = "请求成功。\n${response.body}";
        } else if (type == "postJson") {
          resultPostJson = "请求成功。\n${response.body}";
        }
      });
    } else {
      setState(() {
        if (type == "get") {
          resultGet = "请求失败。\n${response.body}";
        } else if (type == "post") {
          resultPost = "请求失败。\n${response.body}";
        } else if (type == "postJson") {
          resultPostJson = "请求失败。\n${response.body}";
        }
      });
    }
  }
}

// var uri = Uri.parse('https://api.geekailab.com/uapi/test/test');
// var uri = Uri.parse('https://api.geekailab.com/uapi/test/testJson');
// var uri =
//     Uri.parse('https://api.geekailab.com/uapi/test/test?requestPrams=11');
