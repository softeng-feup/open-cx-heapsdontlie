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
      child: this.buildFriends(context),
    );
  }

  Widget buildFriends(BuildContext context) {
    return StoreConnector<AppState, Set<Friend>>(
        converter: (store) => store.state.content['friends'],
        builder: (context, friends) {
          return ListView(
            shrinkWrap: false,
            children: this.generateFriendsCards(friends),
          );
        });
  }

  generateFriendsCards(Set<Friend> friends) {
    final List<Widget> friendsCards = List();
    friends.forEach((friend) => friendsCards.add(FriendCard(friend: friend)));
    return friendsCards;
  }
}
