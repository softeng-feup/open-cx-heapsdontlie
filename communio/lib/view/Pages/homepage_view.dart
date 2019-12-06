import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Theme.of(context).colorScheme.onBackground,
          ),
          margin: const EdgeInsets.all(15.0),
          child: ListView(
            shrinkWrap: false,
            children: this.buildOptions(context),
          ),
        ),
      ),
    );
  }

  List<Widget> buildOptions(BuildContext context) {
    return [
      buildAesthetics(context),
      buildSignupButton(context),
      buildLoginButton(context),
    ];
  }

  Widget buildAesthetics(BuildContext context) {
    return Column(
      children: <Widget>[
        buildWelcomeText(context),
        buildLogo(context),
        buildSlogan(context),
      ],
    );
  }

  Widget buildWelcomeText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.08,
        left: MediaQuery.of(context).size.width * 0.08,
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          'Welcome to...',
          style: Theme.of(context).textTheme.display1.apply(
                fontWeightDelta: -1,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ),
    );
  }

  Widget buildLogo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30, left: 23, right: 23, bottom: 0),
      child: Container(
        alignment: Alignment.center,
        child: Image.asset(
          'assets/communio.png',
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }

  Widget buildSlogan(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 0,
        right: 23,
        bottom: 40,
      ),
      child: Container(
        alignment: Alignment.centerRight,
        child: Text(
          '...passively networking',
          style: Theme.of(context).textTheme.display1.apply(
                fontSizeDelta: -13.5,
                fontWeightDelta: -1,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ),
    );
  }

  Widget buildSignupButton(BuildContext context) {
    final sidePadding = MediaQuery.of(context).size.width * 0.1;
    final height = MediaQuery.of(context).size.width * 0.15;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sidePadding, vertical: 10),
      child: Center(
        child: ButtonTheme(
          minWidth: MediaQuery.of(context).size.width,
          height: height,
          child: FlatButton(
            color: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(height * 0.25),
            ),
            textColor: Theme.of(context).colorScheme.onPrimary,
            onPressed: () {
              Navigator.of(context).pushNamed('/CreateProfile');
            },
            child: Text(
              'Sign Up',
              style: Theme.of(context).textTheme.button.apply(
                  fontSizeDelta: -5,
                  fontWeightDelta: 2,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
          // clickable text
        ),
      ),
    );
  }

  Widget buildLoginButton(BuildContext context) {
    final sidePadding = MediaQuery.of(context).size.width * 0.1;
    final height = MediaQuery.of(context).size.width * 0.15;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sidePadding, vertical: 10),
      child: Center(
        child: ButtonTheme(
          minWidth: MediaQuery.of(context).size.width,
          height: height,
          buttonColor: Theme.of(context).colorScheme.secondary,
          child: OutlineButton(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary, width: 2.5),
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(height * 0.25),
            ),
            textColor: Theme.of(context).colorScheme.onSecondary,
            onPressed: () {
              Navigator.of(context).pushNamed('/Login');
            },
            child: Text(
              'Log In',
              style: Theme.of(context).textTheme.button.apply(
                  fontSizeDelta: -5,
                  fontWeightDelta: 2,
                  color: Theme.of(context).colorScheme.onSecondary),
            ),
          ),
          // clickable text
        ),
      ),
    );
  }
}
