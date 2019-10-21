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
            padding: EdgeInsets.all(20.0),
            children: this.generateFriendsCards(friends),
          );
        }
    );
  }

  List<Widget> childrenSocials(Friend friend) {
    final List<Widget> children = new List<Widget>();
    for (var social in friend.socials) {
      children.add(
        social.logo
      );
    }
    return children;
  }

  generateFriendCard(Friend friend) {
    return new Card(
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(friend.photo),
                        minRadius: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(friend.name),
                              Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Row(
                                      children: <Widget>[
                                        Icon(Icons.location_on),
                                        Padding(
                                            padding: EdgeInsets.only(left: 5.0),
                                            child: Text(
                                                friend.location,
                                                style: TextStyle(fontSize: 16)
                                            )
                                        )
                                      ]
                                  )
                              ),
                            ]
                        ),
                      ),
                    ]
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: childrenSocials(friend)
                  ),
                ),
              ]
            )
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

