import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final _data = fakeData(100);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final fakeData =
    (int count, [bool showPrint = false]) => List<Widget>.generate(count, (i) {
          if (showPrint) print(i);
          return Card(
            margin: EdgeInsets.all(1),
            color: Colors.white,
            child: ListTile(
              title: Text('$i'),
            ),
          );
        });

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horizontal list'),
      ),
      body: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              double _width = constraints.constrainWidth();
              return _width > 600
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: _width > 600 ? 3 : 2,
                        childAspectRatio: _width > 600 ? 2 : 1,
                      ),
                      itemCount: _data.length,
                      itemBuilder: (context, index) => _data[index],
                    )
                  : ListView.builder(
                      itemCount: _data.length,
                      itemBuilder: (context, index) => _data[index]);
            }),
          ),
        ],
      ),
    );
  }
}
