import 'package:flutter/material.dart';
import 'list.dart';

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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const EBayClone(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class EBayClone extends StatefulWidget {
  const EBayClone({Key? key}) : super(key: key);

  @override
  State<EBayClone> createState() => _EBayCloneState();
}

class _EBayCloneState extends State<EBayClone> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.grey),
          backgroundColor: Colors.white,
          title: Container(
            width: 60,
            height: 25,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/ebay.png"),
                    fit: BoxFit.fitHeight)),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
            ),
            Icon(Icons.shopping_cart)
          ],
        ),
        body: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            Visibility(
              visible: _isVisible,
              child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Container(
                      height: 30,
                      margin: EdgeInsets.only(bottom: 8, left: 8, right: 8),
                      padding: EdgeInsets.all(8),
                      color: Colors.grey[200],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.search),
                          Text("Search",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20))
                        ],
                      ))),
            ),
            Container(
              height: 80,
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 15),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 120,
                      height: 40,
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.grey[300]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(icons[index]['icon'], color: Colors.blue),
                          Text(icons[index]['text'],
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 10))
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              color: Colors.indigo,
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("some kinda text",
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                  SizedBox(height: 5),
                  Text("some kinda text",
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                  SizedBox(height: 25),
                ],
              ),
            )
          ]),
        ));
  }
}
