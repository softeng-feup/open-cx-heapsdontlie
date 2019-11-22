import 'package:communio/view/Widgets/create_profile_text_field.dart';
import 'package:communio/view/Widgets/image_upload.dart';
import 'package:communio/view/Widgets/profile_interests.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateProfileForm extends StatefulWidget {
  @override
  CreateProfileFormState createState() {
    return CreateProfileFormState();
  }
}

class CreateProfileFormState extends State<CreateProfileForm> {
  static final emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _agreedToTOS = false;

  final nameController = TextEditingController();
  final eMailController = TextEditingController();
  final passwordController = TextEditingController();
  final confPassController = TextEditingController();

  String name;
  String eMail;

  final List interests = new List();
  final List programmingLanguages = new List();
  final List skills = new List();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: ImageUpload()),
              CreateProfileTextField(
                validateText, 'Name', Icons.person, false),
              CreateProfileTextField(
                validateEmail, 'Email', Icons.email, false),
              CreateProfileTextField(
                validateText, 'Password', Icons.lock, true),
              ProfileInterests(
                type: 'Interests',
                interests: interests,
                edit: true,
              ),
              ProfileInterests(
                type: 'Programming Languages',
                interests: programmingLanguages,
                edit: true,
              ),
              ProfileInterests(
                type: 'Skills',
                interests: skills,
                edit: true,
              ),
              buildTOSCheckbox(),
              buildSubmitButton(),
            ]));
  }

  validateText(value) {
    if (value.trim().isEmpty) return 'Field is empty';
    return null;
  }

  validateEmail(String value) {
    if (value.trim().isEmpty) return 'Field is empty';
    if (!RegExp(emailRegex).hasMatch(value))
      return 'Insert a valid e-mail address';
    return null;
  }

  buildTOSCheckbox() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: GestureDetector(
          onTap: () => _setAgreedToTOS(!_agreedToTOS),
          child: Row(
            children: <Widget>[
              Checkbox(value: _agreedToTOS, onChanged: _setAgreedToTOS),
              Flexible(
                  child: const Text(
                'I agree to the Terms of Service and Privacy Policy',
                style: TextStyle(fontSize: 12),
              ))
            ],
          )),
    );
  }

  buildSubmitButton() {
    return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Center(
            child: RaisedButton(
          onPressed: () {
            if (!_agreedWithTerms()) {
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('You must accept the TOS!')));
            }
            if (_formKey.currentState.validate() && _agreedWithTerms()) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Processing Data')));
            }
          },
          child: Text('Sign Up'),
        )));
  }

  bool _agreedWithTerms() {
    return _agreedToTOS;
  }

  void _setAgreedToTOS(bool value) {
    setState(() {
      _agreedToTOS = value;
    });
  }
}
