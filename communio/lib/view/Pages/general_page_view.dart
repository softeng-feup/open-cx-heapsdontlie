import 'package:communio/view/Widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GeneralPageView extends StatelessWidget{
  final Widget child;
  final Widget floatingActionButton;
  GeneralPageView({
    Key key,
    @required this.child,
    this.floatingActionButton
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('Commun.io'),),
      body: child,
      drawer: new NavigationDrawer(parentContext: context,),
      floatingActionButton: this.floatingActionButton,
    );
  }
}