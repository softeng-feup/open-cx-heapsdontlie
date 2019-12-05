import 'package:communio/view/Widgets/insert_email_field.dart';
import 'package:communio/view/Widgets/profile_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:toast/toast.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                child: SvgPicture.asset('assets/communio.svg')),
            InsertEmailField(emailController),
            ProfilePasswordField(passwordController),
            Padding(
              padding: EdgeInsets.only(
                left: 5.0,
                right: 15.0,
                top: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  buildRememberMeCheckbox(),
                  Text(
                    'Forgot your password?',
                    style: Theme.of(context).textTheme.caption.apply(
                        decoration: TextDecoration.underline,
                        fontSizeDelta: -2),
                  ),
                ],
              ),
            ),
            buildSubmitButton(),
            buildSignupLink(),
          ],
        ));
  }

  _setRememberMe(value) {
    setState(() {
      _rememberMe = value;
    });
  }

  buildRememberMeCheckbox() {
    return GestureDetector(
      onTap: () => _setRememberMe(!_rememberMe),
      child: Row(
        children: <Widget>[
          Checkbox(value: _rememberMe, onChanged: _setRememberMe),
          Text(
            'Keep me signed in',
            style: Theme.of(context).textTheme.caption.apply(fontSizeDelta: -2),
          )
        ],
      ),
    );
  }

  submit() {
    if (_formKey.currentState.validate()) {
      Toast.show('Processing Data', context);
      final email = emailController.text.trim();
      final testPassword = passwordController.text.trim();
      Logger().i("""Email: $email,
Test Password: $testPassword""");
    }
  }

  Widget buildSubmitButton() {
    final height = MediaQuery.of(context).size.width * 0.15;

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Center(
            child: ButtonTheme(
          minWidth: MediaQuery.of(context).size.width,
          height: height,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(height * 0.25)),
            textColor: Theme.of(context).canvasColor,
            onPressed: () {
              submit();
            },
            child: Text(
              'Log In',
              style:
                  Theme.of(context).textTheme.button.apply(fontSizeDelta: -5),
            ),
          ),
          // clickable text
        )));
  }

  Widget buildSignupLink() {
    return Center(
      child: GestureDetector(
        child: Text(
          "Don\'t have an account yet?",
          style: Theme.of(context)
              .textTheme
              .body2
              .apply(decoration: TextDecoration.underline, fontSizeDelta: -5),
        ),
        // onTap: ,
      ),
    );
  }

}
