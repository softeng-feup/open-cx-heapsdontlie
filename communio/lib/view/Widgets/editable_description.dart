import 'package:communio/model/known_person.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class EditableDescription extends StatefulWidget {
  final KnownPerson person;
  final bool edit;
  _EditableDescriptionState state;

  EditableDescription({@required this.person, @required this.edit});

  @override
  _EditableDescriptionState createState() {
    this.state = _EditableDescriptionState(person);
    return this.state;
  }
}

class _EditableDescriptionState extends State<EditableDescription> {
  KnownPerson person;
  TextEditingController controller;
  static bool edit = false;
  static final focusNode = FocusNode(

  );

  _EditableDescriptionState(this.person);

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).size;
    this.controller = TextEditingController(text: person.description);
    return Container(
        width: query.width * 0.65,
        child: buildEditableText(context));
  }

  buildEditableText(BuildContext context) {
    return new GestureDetector(
        onLongPress: () => FocusScope.of(context).requestFocus(focusNode),

    child: EditableText(
        controller: this.controller,
        textAlign: TextAlign.start,
        focusNode: focusNode,
        style: Theme.of(context).textTheme.body2,
        cursorColor: cyanColor,
        maxLines: null,
        backgroundCursorColor: whiteColor,
        textInputAction: TextInputAction.done,
        onSubmitted: _onChangeText),
    );
  }

  _onChangeText(String newDescription) {
    //this.person.description = newDescription;
  }

  buildDescription(BuildContext context) {
    return new GestureDetector(
      onLongPress: () {
        setState(() {
          edit = true;
        });
      },
      child: Text(
        person.description,
        style: Theme.of(context).textTheme.body2,
      ),
    );
  }
}
