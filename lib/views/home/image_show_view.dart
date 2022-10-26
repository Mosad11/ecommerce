import 'package:flutter/material.dart';

class ImageShowView extends StatelessWidget {
  const ImageShowView({Key? key, required this.img}) : super(key: key);
  final String img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Hero(
          tag: 'i',
          child: Center(
            child: Image.network(img),
          )),
    );
  }
}
