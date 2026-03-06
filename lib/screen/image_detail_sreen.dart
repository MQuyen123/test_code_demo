import 'package:flutter/material.dart';

class ImageDetailSreen extends StatelessWidget {
  const ImageDetailSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Image Detail"),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Back"),
          ),
        ],
      ),
    );
  }
}