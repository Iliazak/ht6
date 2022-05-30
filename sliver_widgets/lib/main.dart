import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 360,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: Text('Page Title'),
              background: Image.network(
                'https://picsum.photos/200',
                fit: BoxFit.cover,
                color: Colors.black12,
                colorBlendMode: BlendMode.colorBurn,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              for (var item in fakeData(70)) item,
            ]),
          ),
        ],
      ),
    );
  }
}
