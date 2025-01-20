import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:started_flutter/jsonToxxx/dart_model_02.dart';

class JsonToXxx01 extends StatefulWidget {
  const JsonToXxx01({super.key});

  @override
  State<JsonToXxx01> createState() => _JsonToXxx01State();
}

class _JsonToXxx01State extends State<JsonToXxx01> {
  Map? resultMap;
  DartModel02? model;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
        appBar: AppBar(title: const Text("json转map和DartModel")),
        body: Column(
          children: [
            _jsonToMapBtn(),
            const Text("Json:\n", style: TextStyle(fontSize: 30)),
            Text('$resultMap'),
            _jsonToModelBtn(),
            const Text("DartModel:\n", style: TextStyle(fontSize: 30)),
            Text("${model?.code}\t${model?.msg}\t${model?.ibfilecount}"),
          ],
        ),
      ),
    );
  }

  _jsonToMapBtn() {
    return ElevatedButton(
        onPressed: _jsonToMap, child: const Text("JsonToMap"));
  }

  _jsonToModelBtn() {
    return ElevatedButton(
        onPressed: _jsonToModel, child: const Text("JsonToModel"));
  }

  _jsonToMap() {
    var json = '{ "code": 10, "msg": "Success", "ibfilecount": 100 }';
    setState(() {
      resultMap = jsonDecode(json);
    });
  }

  _jsonToModel() {
    var json = '{ "code": 10, "msg": "Success", "ibfilecount": 100 }';
    var map = jsonDecode(json);
    setState(() {
      model = DartModel02.fromJson(map);
    });
  }
}
