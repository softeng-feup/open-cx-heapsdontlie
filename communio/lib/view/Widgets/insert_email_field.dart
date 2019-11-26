import 'package:communio/view/Widgets/create_profile_text_field.dart';
import 'package:flutter/material.dart';

class InsertEmailField extends StatefulWidget {
  final TextEditingController controller;
  InsertEmailField(this.controller);

  @override
  State<StatefulWidget> createState() {
    return _InsertEmailFieldState(this.controller);
  }
}

class _InsertEmailFieldState extends State<InsertEmailField> {
  static final emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  final TextEditingController controller;
  _InsertEmailFieldState(this.controller);

  validation(value) {
    if (value.trim().isEmpty) return 'Field is empty';
    if (!RegExp(emailRegex).hasMatch(value))
      return 'Insert a valid e-mail address';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return CreateProfileTextField(validation, 'Email', Icons.email,
        controller: this.controller);
  }
}
