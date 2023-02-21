import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Theme Data",
          style: TextStyle(
            fontSize: 30
          ),
          )
        ],
      ),
    );
  }
}
 