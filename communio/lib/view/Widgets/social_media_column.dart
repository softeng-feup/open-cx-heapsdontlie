import 'package:communio/model/known_person.dart';
import 'package:communio/model/social_block.dart';
import 'package:communio/view/theme.dart';
import 'package:flutter/material.dart';

class SocialMediaColumn extends StatefulWidget {
  final KnownPerson person;
  final bool edit;

  SocialMediaColumn({@required this.person, @required this.edit});

  @override
  _SocialMediaColumnState createState() =>
      _SocialMediaColumnState(person, edit);
}

class _SocialMediaColumnState extends State<SocialMediaColumn> {
  final KnownPerson person;
  final bool edit;
  _SocialMediaColumnState(this.person, this.edit);

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;
    return Column(
      children: this.buildMediaRows(context, query),
    );
  }

  buildMediaRows(BuildContext context, Size query) {
    final List<Widget> children = List();
    final List<String> socialList =
      SocialBlock.socialLogo.keys.toList()..removeWhere((key) =>
        person.socials.indexWhere((personSocial) =>
          personSocial.name == key) != -1 || key == "default");
    person.socials.forEach((socialMedia) {
      children.add(Container(
          width: query.width * 0.75,
          margin: EdgeInsets.only(
              top: query.height * 0.005, bottom: query.height * 0.002),
          child: buildExternalRow(context, query, socialMedia)));
    });
    children.add(Container(
      width: query.width * 0.75,
      margin: EdgeInsets.only(
          top: query.height * 0.005, bottom: query.height * 0.002),
      child: buildAddingSocial(context, query, person, socialList)
    ));
    return children;
  }

  buildExternalRow(BuildContext context, Size query, SocialBlock socialMedia) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: buildRowsList(context, query, socialMedia));
  }

  buildRowsList(BuildContext context, Size query, SocialBlock socialMedia) {
    final List<Widget> children = List();
    children.add(
      Container(
          width: query.width * 0.61,
          color: Theme.of(context).colorScheme.primaryVariant,
          child: buildInternalRow(context, query, socialMedia)),
    );

    if (edit) {
      children.add(IconButton(
        icon: Icon(
          Icons.delete,
          color: grayColor,
        ),
        onPressed: () {
          // TO-DO delete from Server
          setState(() {
            person.socials.remove(socialMedia);
          });
        },
      ));
    }
    return children;
  }

  buildInternalRow(BuildContext context, Size query, SocialBlock socialMedia) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Transform(
            alignment: Alignment.center,
            transform: new Matrix4.identity()..scale(0.9, 0.9),
            child: Container(
              margin: EdgeInsets.only(
                  top: query.height * 0.01, bottom: query.height * 0.01),
              child: socialMedia.logo,
            )),
        Container(
            width: query.width * 0.3,
            child: Text(
              socialMedia.url,
              style: Theme.of(context).textTheme.body1.apply(fontSizeDelta: -7),
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            )),
        Container(
            width: query.width * 0.1,
            child: Text(
              socialMedia.name[0].toUpperCase() + socialMedia.name.substring(1),
              style:
                  Theme.of(context).textTheme.body1.apply(fontSizeDelta: -10),
            )),
      ],
    );
  }

  buildAddingSocial(BuildContext context, Size query, KnownPerson person, List<String> remainingSocials) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Transform(
            alignment: Alignment.centerLeft,
            transform: new Matrix4.identity()..scale(0.9, 0.9),
            child: Container(
              margin: EdgeInsets.only(
                  top: query.height * 0.01, bottom: query.height * 0.01),
              child: SocialBlock.socialLogo['default'],
            )),

        new SocialMediaForm(callback: addSocial, remainingSocials: remainingSocials)
      ],
    );
  }

  addSocial(String SocialID, String newSocial) async {
    print(newSocial);
    print(SocialID);
  }
}

class SocialMediaForm extends StatefulWidget {
  final Function(String, String) callback;
  final List<String> remainingSocials;

  const SocialMediaForm({Key key, @required this.callback, @required this.remainingSocials}) : super(key: key);

  @override
  _SocialMediaFormState createState() => _SocialMediaFormState(callback, remainingSocials);
}

class _SocialMediaFormState extends State<SocialMediaForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fieldController = TextEditingController();
  final List<String> remainingSocials;
  int index = 0;

  final Function(String, String) callback;

  _SocialMediaFormState(this.callback, this.remainingSocials);
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.only(top: 3, left: 15),
        child: Row(
          children: <Widget>[buildTextField(context), buildSocialDropdown(context, remainingSocials), buildAddButton(context)],
        ),
      ),
    );
  }

  buildTextField(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      child: TextFormField(
        controller: fieldController,
      ),
    );
  }

  buildAddButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.add),
      onPressed: () {
        if (_formKey.currentState.validate() &&
            fieldController.text.isNotEmpty) {
          callback(fieldController.text, remainingSocials[index]);
        }
        fieldController.clear();
      },
    );
  }

  buildSocialDropdown(BuildContext context, List<String> remainingSocials) {
    return DropdownButton<String>(
      value: remainingSocials[index],
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle (
          color: Colors.deepPurple
      ),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          index = remainingSocials.indexOf(newValue);
        });
      },
    items: remainingSocials
        .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      })
          .toList(),
    );
  }
}
