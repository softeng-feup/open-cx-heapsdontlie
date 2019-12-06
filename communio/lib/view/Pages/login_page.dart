import 'package:communio/view/Pages/secondary_page_view.dart';
import 'package:communio/view/Widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SecondaryPageView(child: buildForm(context));
  }

  Widget buildForm(BuildContext context) {
    return ListView(
      shrinkWrap: false,
      children: <Widget>[
        LoginForm(),
      ],
    );
  }
}
