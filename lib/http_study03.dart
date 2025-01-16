import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpStudy03 extends StatefulWidget {
  const HttpStudy03({super.key});

  @override
  State<StatefulWidget> createState() => HttpStudy03State();
}

class HttpStudy03State extends State<HttpStudy03> {
  var resultShow01 = "";
  var resultShow02 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HttpStudy03"),
      ),
      body: Column(
        children: [
          _doGetBtn(),
          _doPostBtn(),
          _doPostJsonBtn(),
          Text("响应结果：\n$resultShow01\n"),
          Text("响应msg(限于Json的Post请求)：\n$resultShow02\n"),
        ],
      ),
    );
  }

  _doGetBtn() {
    return ElevatedButton(
      onPressed: _doGet,
      child: const Text("发送Get请求"),
    );
  }

  _doPostBtn() {
    return ElevatedButton(
      onPressed: _doPost,
      child: const Text("发送Post请求"),
    );
  }

  _doPostJsonBtn() {
    return ElevatedButton(
      onPressed: _doPostJson,
      child: const Text("发送Post请求(Json)"),
    );
  }

  _doGet() async {
    var url =
        Uri.parse('https://api.geekailab.com/uapi/test/test?requestPrams=11');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        resultShow01 = response.body;
      });
    } else {
      setState(() {
        resultShow01 =
            "Get请求失败\n状态码: ${response.statusCode}\n响应体: ${response.body}";
      });
    }
  }

  _doPost() async {
    var url = Uri.parse('https://api.geekailab.com/uapi/test/test');
    var params = {"requestPrams": "doPost"};
    var response = await http.post(
      url,
      body: params,
    );

    if (response.statusCode == 200) {
      setState(() {
        resultShow01 = response.body;
      });
    } else {
      setState(() {
        resultShow01 =
            "请求失败：code: ${response.statusCode}，body:${response.body}";
      });
    }
  }

  _doPostJson() async {
    var uri = Uri.parse('https://api.geekailab.com/uapi/test/testJson');
    var params = {"requestPrams": "doPost"};
    var response = await http.post(
      uri,
      body: jsonEncode(params),
      headers: {
        "content-type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        resultShow01 = response.body;
      });
      var map = jsonDecode(response.body);
      setState(() {
        resultShow02 = map['msg'];
      });
    } else {
      setState(() {
        resultShow01 =
            "请求失败：code: ${response.statusCode}，body:${response.body}";
      });
    }
  }
}

    // var uri = Uri.parse('https://api.geekailab.com/uapi/test/test');
    // var uri = Uri.parse('https://api.geekailab.com/uapi/test/testJson');
    // var uri =
    //     Uri.parse('https://api.geekailab.com/uapi/test/test?requestPrams=11');
