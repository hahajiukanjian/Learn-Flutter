import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpStudy04 extends StatefulWidget {
  const HttpStudy04({super.key});

  @override
  State<StatefulWidget> createState() => _HttpStudy04State();
}

class _HttpStudy04State extends State<HttpStudy04> {
  var resultGet = '';
  var resultPost = '';
  var resultPostJson = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("http的请求方法")),
      body: Column(children: [
        _doGetBtn(),
        _doPostBtn(),
        _doPostJsonBtn(),
        Text("resultGet:\n$resultGet\n"),
        Text("resultPost:\n$resultPost\n"),
        Text("resultPostJson:\n$resultPostJson\n"),
      ]),
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
    if (response.statusCode == 200) {
      setState(() {
        resultGet = '请求成功。\n状态码: ${response.statusCode}\n响应体: ${response.body}';
      });
    } else {
      setState(() {
        resultGet = '请求失败。\n状态码: ${response.statusCode}\n响应体: ${response.body}';
      });
    }
  }

  _doPost() async {
    var url = Uri.parse('https://api.geekailab.com/uapi/test/test');
    var params = {"requestPrams": "doPost"};
    var response = await http.post(url, body: params);
    if (response.statusCode == 200) {
      setState(() {
        resultPost =
            '请求成功。\n状态码: ${response.statusCode}\n响应体: ${response.body}';
      });
    } else {
      setState(() {
        resultPost =
            '请求失败。\n状态码: ${response.statusCode}\n响应体: ${response.body}';
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
        resultPostJson =
            '请求成功。\n状态码: ${response.statusCode}\n响应体: ${response.body}';
      });
    } else {
      setState(() {
        resultPostJson =
            '请求失败。\n状态码: ${response.statusCode}\n响应体: ${response.body}';
      });
    }
  }
}

// var uri = Uri.parse('https://api.geekailab.com/uapi/test/test');
// var uri = Uri.parse('https://api.geekailab.com/uapi/test/testJson');
// var uri =
//     Uri.parse('https://api.geekailab.com/uapi/test/test?requestPrams=11');
