import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List data;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Load_Json App")),
        ),
        body: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("LoadJson/person.json"),
            builder: ((context, snapshot) {
              var mydata = json.decode(snapshot.data.toString());
              return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("Name:" + mydata[index]["Name"]),
                          Text("Age:" + mydata[index]["Age"]),
                          Text("Height:" + mydata[index]["height"]),
                          Text("Gender:" + mydata[index]["Gender"])
                        ],
                      ),
                    );
                  },
                  itemCount: mydata == null ? 0 : mydata.length);
            }),
          ),
        ),
      ),
    );
  }
}
