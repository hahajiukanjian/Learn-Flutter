import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:started_flutter/future/data_model.dart';

class FutureStudy03 extends StatefulWidget {
  const FutureStudy03({super.key});

  @override
  State<FutureStudy03> createState() => _FutureStudy03State();
}

class _FutureStudy03State extends State<FutureStudy03> {
  var result = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
          appBar: AppBar(title: const Text("Future和FutureBuilder测试")),
          body: FutureBuilder<DataModel>(
            future: _fotchGet(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Text("state none");
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                  return const Text("state active");
                case ConnectionState.done:
                  if (!snapshot.hasError) {
                    return Text(
                        "请求成功。\n${snapshot.data?.code}\n${snapshot.data?.data?['requestPrams']}\n");
                  } else {
                    return Text(
                        "请求失败。\n${snapshot.data?.code}\n${snapshot.data?.data?['requestPrams']}\n");
                  }
              }
            },
          )),
    );
  }

  Future<DataModel> _fotchGet() async {
    var url =
        Uri.parse("https://api.geekailab.com/uapi/test/test?requestPrams=11");
    var response = await http.get(url);
    var map = jsonDecode(response.body);
    return DataModel.fromJson(map);
  }
}
