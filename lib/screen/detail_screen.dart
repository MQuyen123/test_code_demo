import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail")),
      backgroundColor: Colors.orange,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Back"),
        ),
      ),
    );
  }
}