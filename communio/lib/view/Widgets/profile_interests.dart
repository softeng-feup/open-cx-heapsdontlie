import 'dart:convert';
import 'dart:io';

import 'package:communio/model/app_state.dart';
import 'package:communio/view/Widgets/filter_card.dart';
import 'package:communio/view/Widgets/textfield_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart' as http;

class ProfileInterests extends StatefulWidget {
  final List interests;
  final String type;
  final String name;
  final bool edit;

  const ProfileInterests(
      {Key key,
      this.interests,
      this.type,
      @required this.edit,
      @required this.name})
      : super(key: key);
  @override
  _ProfileInterestsState createState() =>
      _ProfileInterestsState(interests, type, edit, name);
}

class _ProfileInterestsState extends State<ProfileInterests> {
  final List interests;
  final String type;
  final String name;
  final bool edit;

  _ProfileInterestsState(this.interests, this.type, this.edit, this.name);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: buildInterestsCol(context),
    );
  }

  buildInterestsCol(BuildContext context) {
    final List<Widget> children = List();
    final padding = MediaQuery.of(context).size.height * 0.008;
    children.add(buildInterestTitle(context));

    children.add(Container(
      padding: EdgeInsets.only(top: padding, bottom: padding),
      child: SizedBox(
        height: Theme.of(context).textTheme.body2.fontSize + 25,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: buildCurrentInterests(context),
        ),
      ),
    ));
    if (edit) {
      children.add(TextFieldForm(
        callback: addInterest,
      ));
    }
    return children;
  }

  buildInterestTitle(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05, top: 10),
        child: Text(
          name,
          style: Theme.of(context).textTheme.body2,
        ));
  }

  buildCurrentInterests(BuildContext context) {
    final List<Widget> interestsCards = List();
    interests.forEach((interest) {
      interestsCards.add(FilterCard(
        filter: interest,
        removeFilter: () async {
          final String profile =
              StoreProvider.of<AppState>(context).state.content['user_id'];
          final Map<String, String> body={
            '$type': interest
          };
          await http
              .post(
                '${DotEnv().env['API_URL']}users/tags/$profile', body: json.encode(body), headers: {
                      HttpHeaders.contentTypeHeader: 'application/json',
                  }
          );
          setState(() {
            interests.remove(interest);
          });
        },
      ));
    });
    return interestsCards;
  }

  addInterest(String interest) async {
    final String profile =
        StoreProvider.of<AppState>(context).state.content['user_id'];
    final Map<String, String> body={
      '$type': interest
    };
    await http
        .put(
          '${DotEnv().env['API_URL']}users/tags/$profile', body: json.encode(body), headers: {
                HttpHeaders.contentTypeHeader: 'application/json',
            }
    );
    setState(() {
      interests.add(interest);
    });
  }
}
