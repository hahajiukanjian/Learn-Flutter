import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:started_flutter/jsonToxxx/dart_model.dart';

class JsonToXxx extends StatefulWidget {
  const JsonToXxx({super.key});

  @override
  State<StatefulWidget> createState() => _JsonToXxxState();
}

class _JsonToXxxState extends State<JsonToXxx> {
  var resultMap = '';
  var resultModel = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("JsonToXXX")),
      body: Column(
        children: [
          _jsonToMapBtn(),
          _jsonToDartMoedlBtn(),
          Text("Json转Map\n$resultMap"),
          Text("\nJson转DartModel\n$resultModel"),
        ],
      ),
    );
  }

  _jsonToMapBtn() {
    return ElevatedButton(onPressed: _jsonToMap, child: const Text("Json转Map"));
  }

  _jsonToDartMoedlBtn() {
    return ElevatedButton(
        onPressed: _jsonToDartModel, child: const Text("Json转DartModel"));
  }

  _jsonToMap() {
    var jsonData =
        '{ "code": 200, "data": { "msg": "Success", "IBFileConvertFileCount": 100 } }';
    var mapData = jsonDecode(jsonData);
    setState(() {
      resultMap =
          '"code"=${mapData["code"]}\n"msg"=${mapData["data"]["msg"]}\n"文件变换数"=${mapData["data"]["IBFileConvertFileCount"]}';
    });
  }

  _jsonToDartModel() {
    var jsonData =
        '{ "code": 200, "data": { "msg": "Success", "IBFileConvertFileCount": 100 } }';
    var mapData = jsonDecode(jsonData);
    Data dartModel = Data.fromJson(mapData);
    setState(() {
      resultModel =
          '"code"=${dartModel.code}\n"msg"=${dartModel.msg}\n"文件变换数"=${dartModel.ibfilecount}';
    });
  }
}
