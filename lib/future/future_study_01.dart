import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:started_flutter/future/data_model.dart';
import 'package:http/http.dart' as http;

class FutureStudy01 extends StatefulWidget {
  const FutureStudy01({super.key});

  @override
  State<FutureStudy01> createState() => _FutureStudy01State();
}

class _FutureStudy01State extends State<FutureStudy01> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
        appBar: AppBar(title: const Text("Future与FutureBuilder的学习测试")),
        body: FutureBuilder<DataModel>(
          future: fetchGet(),
          builder: (BuildContext context, AsyncSnapshot<DataModel> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text('state none');
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.active:
                return const Text('state active');
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Text(
                    '${snapshot.error}',
                    style: const TextStyle(color: Colors.red),
                  );
                } else {
                  return Column(children: <Widget>[
                    Text('code:${snapshot.data?.code}'),
                    Text(
                        'requestPrams:${snapshot.data?.data?["requestPrams"]}'),
                  ]);
                }
            }
          },
        ),
      ),
    );
  }

  Future<DataModel> fetchGet() async {
    var uri =
        Uri.parse("https://api.geekailab.com/uapi/test/test?requestPrams=11");
    final response = await http.get(uri);
    var result = jsonDecode(response.body);
    return DataModel.fromJson(result);
  }
}
