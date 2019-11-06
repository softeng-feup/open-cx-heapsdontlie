import 'package:communio/view/Widgets/filter_card.dart';
import 'package:communio/view/Widgets/textfield_form.dart';
import 'package:flutter/material.dart';

class ProfileInterests extends StatefulWidget {
  final List interests;
  final String type;
  final bool edit;

  const ProfileInterests(
      {Key key, this.interests, this.type, @required this.edit})
      : super(key: key);
  @override
  _ProfileInterestsState createState() =>
      _ProfileInterestsState(interests, type, edit);
}

class _ProfileInterestsState extends State<ProfileInterests> {
  final List interests;
  final String type;
  final bool edit;

  _ProfileInterestsState(this.interests, this.type, this.edit);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: buildInterestsCol(context),
    );
  }

  buildInterestsCol(BuildContext context) {
    final List<Widget> children = List();
    children.add(buildInterestTitle(context));

    children.add(SizedBox(
      height: Theme.of(context).textTheme.body2.fontSize + 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: buildCurrentInterests(context),
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
        padding:
            EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
        child: Text(
          type,
          style: Theme.of(context).textTheme.body2,
        ));
  }

  buildCurrentInterests(BuildContext context) {
    final List<Widget> interestsCards = List();
    interests.forEach((interest) {
      interestsCards.add(FilterCard(
        filter: interest,
        removeFilter: () {
          //TO-DO Remove from server
          setState(() {
            interests.remove(interest);
          });
        },
      ));
    });
    return interestsCards;
  }

  addInterest(String interest) {
    // TO-DO Add to server
    setState(() {
      interests.add(interest);
    });
  }
}
