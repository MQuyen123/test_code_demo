import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/image');
              },
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/2/29/V%E1%BB%8Bnh_H%E1%BA%A1_Long_-_NKS.jpg',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/detail');
              },
              child: const Text("Go to Detail"),
            ),
          ],
        ),
      ),
    );
  }
}
