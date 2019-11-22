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
              buildTextField(validateText, 'Name'),
              buildTextField(validateEmail, 'Email'),
              buildTextField(validateText, 'Password'),
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

  buildTextField(Function validFunc, String name) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        validator: (value) {
          return validFunc(value);
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email,
            color: Theme.of(context).colorScheme.primaryVariant,
          ),
          hintText: name,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.primaryVariant,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Theme.of(context).buttonColor,
            width: 1.5,
            style: BorderStyle.solid,
          )),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSurface,
              width: 1.5,
              style: BorderStyle.solid,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: 1.5,
              style: BorderStyle.solid,
            ),
          ),
        ),
        maxLines: 1,
      ),
    );
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
