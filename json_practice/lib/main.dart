import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List mockdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mockdata = [];
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("IOS DATA"),
      ),
      child: mockdata.isEmpty
          ? const Text("data is not available")
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: ((context, key) {
                return Card(
                  child: Row(
                    children: [
                      Image.network(mockdata[key]["images"][0],
                          width: 100, height: 100, fit: BoxFit.contain),
                      SizedBox(
                        height: 100,
                        width: 50,
                      ),
                      Text(
                        mockdata[key]["title"],
                      ),
                    ],
                  ),
                );
              }),
              itemCount: mockdata.length,
            ),
    );
  }

  Future<String> getData() async {
    var url = Uri.parse("http://dummyjson.com/products");

    var res = await http.get(url);

    setState(() {
      var dB = json.decode((res.body));
      List convert = dB["products"];
      mockdata.addAll(convert);
    });
    return res.body;
  }
}
