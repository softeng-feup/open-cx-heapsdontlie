import 'package:communio/model/friend.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FriendCard extends StatefulWidget {

  final Friend friend;

  const FriendCard({Key key, @required this.friend}) : super(key: key);

  @override
  _FriendCardState createState() => _FriendCardState(friend);

}

class _FriendCardState extends State<FriendCard> {

  final Friend friend;
  bool opened = false;

  _FriendCardState(this.friend);

  @override
  Widget build(BuildContext context) {
    return new Card(
        margin: EdgeInsets.all(0.0),
        shape: ContinuousRectangleBorder(),
        child: Column(children: <Widget>[
          generateFriendMainCard(friend),
          generateFriendSocialsContainer(friend)
        ]));
  }

  Widget generateFriendSocialsContainer(Friend friend) {
    return this.opened
        ? Container(
            alignment: Alignment.center,
            color: Color.fromARGB(200, 255, 230, 200),
            // will be color of the theme
            height: 80.0,
            child: new ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: generateFriendSocials(this.friend)))
        : Container();
  }

  List<Widget> generateFriendSocials(Friend friend) {
    final List<Widget> children = new List<Widget>();
    for (var social in friend.socials) {
      children.add(new Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: SvgPicture.asset(
            social.logo,
            color: Color.fromARGB(255, 70, 0, 0),
            // will be color of the theme
          )));
    }
    return children;
  }

  Widget generateFriendPhoto(Friend friend) {
    return CircleAvatar(
      backgroundImage: NetworkImage(friend.photo),
      minRadius: 30,
    );
  }

  Widget generateFriendLocation(Friend friend) {
    return Row(children: <Widget>[
      Icon(
        Icons.location_on,
        color: Color.fromARGB(255, 70, 0, 0),
        // will be color of the theme
      ),
      Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Text(friend.location, style: TextStyle(fontSize: 14)))
    ]);
  }

  Widget generateFriendInfo(Friend friend) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(friend.name, style: TextStyle(fontSize: 22)),
          Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: generateFriendLocation(friend)),
        ]);
  }

  Widget generateFriendMainCard(Friend friend) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            generateFriendPhoto(friend),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: generateFriendInfo(friend),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: FlatButton(
                  onPressed: () {
                    setState(() {this.opened = !this.opened;});
                  },
                  child: Icon(
                    this.opened
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: 35.0,
                    color: Color.fromARGB(255, 70, 0, 0),
                  ),
                )
            )
          ]
      ),
    );
  }

}
