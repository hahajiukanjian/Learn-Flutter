import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String tips = "";
  bool _toggle = true;

  get _dyWidget => _toggle ? const Text("Widget1") : const Text("Widget2");

  get _listView => ListView(
        children: const [
          Text("噫嘘唏"),
          Text("维护高在"),
          Text("宝贝我爱你"),
          Text("宝贝我爱你", style: TextStyle(fontSize: 200)),
          Text("我爱曹旭", style: TextStyle(fontWeight: FontWeight.w900)),
          Text("曹旭爱我", style: TextStyle(color: Colors.red)),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: GestureDetector(
          onLongPress: () {
            setState(() {
              _counter++;
            });
          },
          child: Text("点击了$_counter次"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateWidget,
        tooltip: 'Update Tips',
        child: const Icon(Icons.update),
      ),
    );
  }

  // 更新Flutter布局
  void _updateTips() {
    setState(() {
      tips = "Hello, Flutter!";
    });
  }

  // 修改或者删除一个Widget
  void _updateWidget() {
    setState(() {
      _toggle = !_toggle;
    });
  }
}

class TipsWidget extends StatelessWidget {
  const TipsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("自定义Widget");
  }
}
