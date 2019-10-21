import 'package:communio/view/Pages/general_page_view.dart';
import 'package:flutter/material.dart';

class SettingsPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GeneralPageView(
      child: ListView(
        children: this.buildSettings(context),
      ),
    );
  }

  List<Widget> buildSettings(BuildContext context) {
    return [
      FlatButton(
        child: Text('Choose beacon'),
        onPressed: () {
          
          Navigator.of(context).pushNamed('/SetBeacon');
        },
      )
    ];
  }
}