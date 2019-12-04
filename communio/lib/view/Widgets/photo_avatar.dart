import 'package:communio/view/theme.dart';
import 'package:flutter/material.dart';

class PhotoAvatar extends StatelessWidget {

  final String photo;
  PhotoAvatar({
    @required this.photo
  });


  @override
  Widget build(BuildContext context) {
    return (
      CircleAvatar(
        backgroundColor: whiteColor,
        backgroundImage: NetworkImage(photo),
        minRadius: 30,
      )
    );
  }
}