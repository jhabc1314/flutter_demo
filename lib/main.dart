import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Widget",
    home: MyApp(),
  ));
}

class Mybutton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("mybutton was tapped"),
      child: Container(
        height: 36,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: Center(),
      ),
    );

  }
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
