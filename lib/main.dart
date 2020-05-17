import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Widget",
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu),
        tooltip: 'Navigation Menu',
        onPressed: null,
      ),
      title: Text("Example 标题"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          tooltip: '搜索',
          onPressed: null,
        )
      ],
    );
    var body = Center(
      child: Text("你好 世界"),
    );
    var floatActionButton = FloatingActionButton(
      tooltip: 'Add',
      child: Icon(Icons.add),
      onPressed: null,
    );

    //赋值
    return Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: floatActionButton,
    );
  }
}
