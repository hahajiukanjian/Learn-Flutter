import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpStudy02 extends StatefulWidget {
  const HttpStudy02({super.key});

  @override
  State<HttpStudy02> createState() => _HttpStudy02State();
}

class _HttpStudy02State extends State<HttpStudy02> {
  var resultShow = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("http的练习"),
      ),
      body: Column(
        children: [
          _doGetBtn(),
          Text("响应结果\n$resultShow"),
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

  _doGet() async {
    var url =
        Uri.parse('https://api.geekailab.com/uapi/test/test?requestPrams=11');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        resultShow = response.body;
      });
    }
  }
}

    // var uri = Uri.parse('https://api.geekailab.com/uapi/test/test');
    // var uri = Uri.parse('https://api.geekailab.com/uapi/test/testJson');
    // var uri =
    //     Uri.parse('https://api.geekailab.com/uapi/test/test?requestPrams=11');