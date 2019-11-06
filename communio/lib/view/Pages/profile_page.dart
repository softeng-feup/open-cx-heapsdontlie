import 'dart:convert';

import 'package:communio/model/known_person.dart';
import 'package:communio/view/Pages/general_page_view.dart';
import 'package:communio/view/Pages/secondary_page_view.dart';
import 'package:communio/view/Widgets/photo_avatar.dart';
import 'package:communio/view/Widgets/profile_interests.dart';
import 'package:communio/view/Widgets/social_media_column.dart';
import 'package:communio/view/theme.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String profileId;
  final KnownPerson knownPerson;
  final bool edit;
  static Future<KnownPerson> person;

  ProfilePage({this.profileId, this.knownPerson, @required this.edit}) {
    if (person == null) person = getPerson(profileId);
  }

  @override
  Widget build(BuildContext context) {
    if(knownPerson != null){
      return SecondaryPageView(
        child: buildPerson(context, knownPerson),
      );
    }
    return GeneralPageView(
        child: FutureBuilder<KnownPerson>(
      future: person,
      builder: (BuildContext context, AsyncSnapshot<KnownPerson> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done &&
            !snapshot.hasError) {
          final person = snapshot.data;
          return buildPerson(context, person);
        }
        return Container();
      },
    ));
  }

  buildPerson(BuildContext context, KnownPerson person) {
    final query = MediaQuery.of(context).size;
    return ListView(
      children: <Widget>[
        buildImage(context, person, query),
        buildName(person, context, query),
        buildLocation(person, context, query),
        buildDescription(person, context, query),
        buildSocialMedia(person, context, query),
        ProfileInterests(
          interests: person.interests,
          type: 'Interests',
          edit: edit,
        ),
        ProfileInterests(
          interests: person.programmingLanguages,
          type: 'Programming Languages',
          edit: edit,
        ),
        ProfileInterests(
          interests: person.skills,
          type: 'Skills',
          edit: edit,
        )
      ],
    );
  }

  Widget padWidget({Widget child, Size query}) {
    return Padding(
        padding: EdgeInsets.only(
            top: query.height * 0.005,
            bottom: query.height * 0.005,
            left: query.height * 0.05,
            right: query.height * 0.05),
        child: child);
  }

  Widget buildName(KnownPerson person, BuildContext context, Size query) {
    return padWidget(
        child: Center(
          child: Text(
            person.name,
            style: Theme.of(context).textTheme.body2.apply(fontSizeDelta: 10),
          ),
        ),
        query: query);
  }

  buildImage(BuildContext context, KnownPerson person, Size query) {
    return padWidget(
        child: Container(
          margin: EdgeInsets.only(top: query.height * 0.06),
          padding: EdgeInsets.only(
              left: query.height * 0.1, right: query.height * 0.1),
          height: query.height * 0.2,
          child: PhotoAvatar(
            photo: person.photo,
          ),
        ),
        query: query);
  }

  buildLocation(KnownPerson person, BuildContext context, Size query) {
    return padWidget(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: cyanColor,
              ),
              Text(
                person.location,
                style: Theme.of(context).textTheme.body2,
              )
            ],
          ),
        ),
        query: query);
  }

  buildDescription(KnownPerson person, BuildContext context, Size query) {
    return buildRowWithItem(
        context,
        Icons.info,
        Container(
          width: query.width * 0.75,
          child: Text(
            person.description,
            style: Theme.of(context).textTheme.body2,
          ),
        ),
        query);
  }

  buildSocialMedia(KnownPerson person, BuildContext context, Size query) {
    return buildRowWithItem(
          context,
          Icons.person,
          SocialMediaColumn(
            person: person,
            edit: edit
          ),
          query);
  }

  buildRowWithItem(
      BuildContext context, IconData iconData, Widget widget, Size query) {
    return Padding(
        padding: EdgeInsets.only(
        top: query.height * 0.03,
        bottom: query.height * 0.03,
        ),
       child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: query.width * 0.13,
            child: Center(
              child: Icon(
                iconData,
                color: cyanColor,
              ),
            ),
          ),
          Container(
            child: widget,
          )
        ],
      ),
    );
    }

  

  Future<KnownPerson> getPerson(String profileId) async {
    final response = await http
        .get('http://www.mocky.io/v2/5dc2f17f2f000072004be502/$profileId');
    final map = json.decode(utf8.decode(response.bodyBytes));
    return KnownPerson.fromJson(map);
  }
}
