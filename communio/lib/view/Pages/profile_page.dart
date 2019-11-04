import 'package:communio/model/person_found.dart';
import 'package:communio/view/Pages/general_page_view.dart';
import 'package:communio/view/Widgets/photo_avatar.dart';
import 'package:communio/view/theme.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String profileId;

  ProfilePage({@required this.profileId});

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;
    return GeneralPageView(
        child: FutureBuilder<PersonFound>(
      future: PersonFound.fromNetwork(
          'http://www.mocky.io/v2/5dc05cd431000078e4be40b6/$profileId'),
      builder: (BuildContext context, AsyncSnapshot<PersonFound> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done &&
            !snapshot.hasError) {
          final person = snapshot.data;
          return ListView(
            padding: EdgeInsets.only(
                left: query.height * 0.05, right: query.height * 0.05),
            children: <Widget>[
              buildImage(context, person, query),
              buildName(person, context, query),
              buildLocation(person, context, query),
              buildDescription(person, context, query)
            ],
          );
        }
        return Container();
      },
    ));
  }

  Widget padWidget({Widget child, Size query}) {
    return Padding(
        padding: EdgeInsets.only(
            top: query.height * 0.005, bottom: query.height * 0.005),
        child: child);
  }

  Widget buildName(PersonFound person, BuildContext context, Size query) {
    return padWidget(
        child: Center(
          child: Text(
            person.name,
            style: Theme.of(context).textTheme.body2.apply(fontSizeDelta: 5),
          ),
        ),
        query: query);
  }

  buildImage(BuildContext context, PersonFound person, Size query) {
    return padWidget(
        child: Container(
          margin: EdgeInsets.only(
              top: query.height * 0.06),
          padding: EdgeInsets.only(
              left: query.height * 0.1, right: query.height * 0.1),
          height: query.height * 0.2,
          child: PhotoAvatar(
            photo: person.photo,
          ),
        ),
        query: query);
  }

  buildLocation(PersonFound person, BuildContext context, Size query) {
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

  buildDescription(PersonFound person, BuildContext context, Size query) {
    return padWidget(
        child: Center(
          child: Text(
            person.description,
            style: Theme.of(context).textTheme.body2,
            textAlign: TextAlign.center,
          ),
        ),
        query: query);
  }
}
