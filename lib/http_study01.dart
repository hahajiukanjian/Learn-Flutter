import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpStudy01 extends StatefulWidget {
  const HttpStudy01({super.key});

  @override
  State<StatefulWidget> createState() => _HttpStudy01State();
}

class _HttpStudy01State extends State<HttpStudy01> {
  var resultShow = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('基于Http实现网络操作'),
      ),
      body: Column(
        children: [
          _doGetBtn(),
          Text("返回的结果是\n$resultShow"),
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
    var uri =
        Uri.parse('https://api.geekailab.com/uapi/test/test?requestPrams=11');
    http.get(uri).then((response) {
      if (response.statusCode == 200) {
        setState(() {
          resultShow = response.body;
        });
      } else {
        setState(() {
          resultShow =
              "请求失败：\ncode: ${response.statusCode},\nbody: ${response.body}";
        });
      }
    });
  }
}
