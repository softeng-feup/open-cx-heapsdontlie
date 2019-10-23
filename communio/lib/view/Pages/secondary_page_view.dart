import 'package:flutter/material.dart';

class SecondaryPageView extends StatelessWidget {
  final Widget child;
  SecondaryPageView({
    @required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Commun.io'),
        leading: BackButton(),
      ),
      body: child,
      
    );
  }
}