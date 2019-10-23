import 'package:communio/model/app_state.dart';
import 'package:communio/model/friend.dart';
import 'package:communio/redux/action_creators.dart';
import 'package:communio/view/Pages/general_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConnectedListingPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    StoreProvider.of<AppState>(context).dispatch(queryFriendsList());
    return GeneralPageView(
        child: Container(
          child: this.buildFriends(context),
        )
    );
  }

  Widget buildFriends(BuildContext context) {

    return StoreConnector<AppState, List<Friend>>(
        converter: (store) => store.state.content['friends'],
        builder: (context, friends){
          return ListView(
            shrinkWrap: false,
            padding: const EdgeInsets.all(20.0),
            children: this.generateFriendsCards(friends),
          );
        }
    );
  }

  Widget generateFriendPhoto(Friend friend) {
    return CircleAvatar(
      backgroundImage: NetworkImage(friend.photo),
      minRadius: 30,
    );
  }

  Widget generateFriendLocation(Friend friend) {
    return Row(
        children: <Widget>[
          Icon(
            Icons.location_on,
            color: Color.fromARGB(255, 70, 0, 0),
            // will be color of the theme
          ),
          Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: Text(
                  friend.location,
                  style: TextStyle(fontSize: 14)
              )
          )
        ]
    );
  }

  Widget generateFriendInfo(Friend friend) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              friend.name,
              style: TextStyle(fontSize: 22)
          ),
          Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: generateFriendLocation(friend)
          ),
        ]
    );
  }

  Widget generateFriendMainCard(Friend friend) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
          children: <Widget>[
            generateFriendPhoto(friend),
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: generateFriendInfo(friend)
            ),
          ]

      ),
    );
  }
  
  List<Widget> generateFriendSocials(Friend friend) {
    final List<Widget> children = new List<Widget>();
    for (var social in friend.socials) {
      children.add(
          new Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: SvgPicture.asset(
                social.logo,
                color: Color.fromARGB(255, 70, 0, 0),
                // will be color of the theme
              )
          )
      );
    }
    return children;
  }

  Widget generateFriendSocialsContainer(Friend friend) {
    return Container(
      alignment: Alignment.center,
      color: Color.fromARGB(200, 255, 230, 200),
      // will be color of the theme
      height: 80.0,
      child: new ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: generateFriendSocials(friend)
      )
    );
  }

  generateFriendCard(Friend friend) {
    return new Card(
        shape: ContinuousRectangleBorder(),
        child: Column(
            children: <Widget>[
              generateFriendMainCard(friend),
              generateFriendSocialsContainer(friend)
            ]
        )
    );
  }

  generateFriendsCards(List<Friend> friends) {
    final List<Widget> friendsCards = List();
    for (Friend friend in friends) {
      friendsCards.add(this.generateFriendCard(friend));
    }
    return friendsCards;
  }
}

