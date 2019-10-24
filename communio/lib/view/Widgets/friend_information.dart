import 'package:flutter/material.dart';

class FriendInformation extends StatelessWidget {
  final String name;
  final String location;

  FriendInformation({@required this.name, @required this.location});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(name, style: TextStyle(fontSize: 22)),
          generateFriendLocation(location),
        ]);
  }

  Widget generateFriendLocation(String location) {
    return Row(children: <Widget>[
      Icon(
        Icons.location_on,
        color: Color.fromARGB(255, 70, 0, 0),
        // will be color of the theme
      ),
      Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Text(location, style: TextStyle(fontSize: 14)))
    ]);
  }
}
