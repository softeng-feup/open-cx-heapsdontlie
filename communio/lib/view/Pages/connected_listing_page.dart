import 'package:communio/model/app_state.dart';
import 'package:communio/model/friend.dart';
import 'package:communio/view/Pages/general_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ConnectedListingPage extends StatelessWidget{

  Future<List<Friend>> fetchFriends() async {
    final url = 'http://www.mocky.io/v2/5dacb15e30000067002987b8';
    final response = await http.get(url);

    final friends = List<Friend>();

    if (response.statusCode == 200) {
      final friendsJson = json.decode(response.body);
      for (var friendJson in friendsJson) {
        final Friend temp = Friend.fromJson(friendJson);

        print("");
        print("-- NEW FRIEND --");
        print("name: ${temp.name}");
        print("location: ${temp.location}");
        print("photo: ${temp.photo}");
        print("interests:");
        for (var interest in temp.interests) {
          print("-- interest: ${interest}");
        }
        print("socials:");
        for (var block in temp.socials) {
          print("-- social: ${block.name} - ${block.url}");
        }
        print("");

        friends.add(temp);
      }
    }
    print("number of friends: ${friends.length}");
    return friends;

  }

  @override
  Widget build(BuildContext context) {
//    StoreProvider.of<AppState>(context).dispatch(queryFriendsList());
    return GeneralPageView(
        child: Container(
          child: this.buildFriends(context),
        )
    );
  }

  Widget buildFriends(BuildContext context) {

    final List<Friend> friends = List<Friend>();
    fetchFriends().then((value) {
      friends.addAll(value);
    });

    return StoreConnector<AppState, List<Friend>>(
//        converter: (store) => store.state.content['friends'],
        builder: (context, friends){
          return ListView(
            shrinkWrap: false,
            padding: EdgeInsets.all(20.0),
            children: this.generateFriendsCards(friends),
          );
        }
    );
  }

  generateFriendCard(Friend friend) {
    return new Card(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(friend.photo),
                    minRadius: 30,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(friend.name),
                        Text(friend.location)
                      ]
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

