import 'package:communio/view/Widgets/insert_email_field.dart';
import 'package:communio/view/Widgets/insert_name_field.dart';
import 'package:communio/view/Widgets/insert_new_password_field.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:toast/toast.dart';

class CreateProfileForm extends StatefulWidget {
  @override
  CreateProfileFormState createState() {
    return CreateProfileFormState();
  }
}

class CreateProfileFormState extends State<CreateProfileForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _agreedToTOS = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 25, bottom: 18),
          child: Text("Create an Account",
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .apply(fontSizeDelta: 1.5, fontWeightDelta: 3)),
        ),
        Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InsertNameField(nameController),
                  InsertEmailField(emailController),
                  InsertNewPasswordField(passwordController),
                  buildTOSCheckbox(),
                  buildSubmitButton(),
                  buildLoginLink(),
                ]))
      ],
    );
  }

  buildTOSCheckbox() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: GestureDetector(
          onTap: () => _setAgreedToTOS(!_agreedToTOS),
          child: Row(
            children: <Widget>[
              Checkbox(
                value: _agreedToTOS,
                onChanged: _setAgreedToTOS,
                checkColor: Theme.of(context).colorScheme.onPrimary,
                activeColor: Theme.of(context).colorScheme.primary,
              ),
              Flexible(
                  child: Text(
                      'I agree to the Terms of Service and Privacy Policy',
                      style: Theme.of(context)
                          .textTheme
                          .body2
                          .apply(fontSizeDelta: -6)))
            ],
          )),
    );
  }

  submit() {
    if (!_agreedWithTerms()) {
      Toast.show('You must accept the TOS!', context);
      return;
    }

    if (_formKey.currentState.validate() && _agreedWithTerms()) {
      Toast.show('Processing Data', context);
      final name = nameController.text.trim();
      final email = emailController.text.trim();
      final testPassword = passwordController.text.trim();
      Logger().i("""Name: $name,
Email: $email,
Test Password: $testPassword,""");
    }
  }

  Widget buildSubmitButton() {
    final height = MediaQuery.of(context).size.width * 0.15;

    return Padding(
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        child: Center(
            child: ButtonTheme(
                minWidth: MediaQuery.of(context).size.width,
                height: height,
                child: FlatButton(
                  color: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(height * 0.25)),
                  textColor: Theme.of(context).canvasColor,
                  onPressed: () {
                    submit();
                  },
                  child: Text(
                    'CONTINUE',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .apply(fontSizeDelta: -8, fontWeightDelta: 1),
                  ),
                ))));
  }

  Widget buildLoginLink() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: GestureDetector(
          child: Text(
            "Already have an account?",
            style: Theme.of(context)
                .textTheme
                .body2
                .apply(decoration: TextDecoration.underline, fontSizeDelta: -5),
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/Login');
          },
        ),
      ),
    );
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
