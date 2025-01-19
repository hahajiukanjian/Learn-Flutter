import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:started_flutter/future/data_model.dart';

class FutureStudy02 extends StatefulWidget {
  const FutureStudy02({super.key});

  @override
  State<FutureStudy02> createState() => _FutureStudy02State();
}

class _FutureStudy02State extends State<FutureStudy02> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
        appBar: AppBar(title: const Text("Future和FutureBuilder测试")),
        body: FutureBuilder<DataModel>(
          future: _fetchGet(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text("state none");
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.active:
                return const Text("state active");
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Text(
                      "请求失败。\n${snapshot.data?.code}\n${snapshot.data?.data?['requestPrams']}");
                } else {
                  return Text(
                      "请求成功。\n${snapshot.data?.code}\n${snapshot.data?.data?['requestPrams']}");
                }
            }
          },
        ),
      ),
    );
  }

  Future<DataModel> _fetchGet() async {
    var url =
        Uri.parse("https://api.geekailab.com/uapi/test/test?requestPrams=11");
    var response = await http.get(url);
    var result = jsonDecode(response.body);
    return DataModel.fromJson(result);
  }
}
