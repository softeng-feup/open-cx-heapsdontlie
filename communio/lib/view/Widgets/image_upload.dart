import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageUpload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircleAvatar(
            radius: 100,
            backgroundColor: Theme.of(context).canvasColor,
            child: ClipOval(
                child: SizedBox(
                    width: 180.0,
                    height: 180.0,
                    child: Image.network(
                      "https://images.unsplash.com/photo-1574100004472-e536d3b6bacc?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
                      fit: BoxFit.cover,
                    )))));
  }
}
