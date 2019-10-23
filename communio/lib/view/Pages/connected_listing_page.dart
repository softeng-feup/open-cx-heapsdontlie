import 'package:communio/model/app_state.dart';
import 'package:communio/model/friend.dart';
import 'package:communio/redux/action_creators.dart';
import 'package:communio/view/Pages/general_page_view.dart';
import 'package:communio/view/Widgets/friend_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ConnectedListingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StoreProvider.of<AppState>(context).dispatch(queryFriendsList());
    return GeneralPageView(
        child: Container(
          margin: const EdgeInsets.all(15.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: this.buildFriends(context),
          )
//          child: this.buildFriends(context),
        )
    );
  }

  Widget buildFriends(BuildContext context) {
    return StoreConnector<AppState, List<Friend>>(
        converter: (store) => store.state.content['friends'],
        builder: (context, friends) {
          return ListView(
            shrinkWrap: false,
//            padding: const EdgeInsets.all(20.0),
            children: this.generateFriendsCards(friends),
          );
        }
    );
  }

  generateFriendsCards(List<Friend> friends) {
    final List<Widget> friendsCards = List();
    for (Friend friend in friends) {
      friendsCards.add(FriendCard(friend: friend));
    }
    return friendsCards;
  }
}
