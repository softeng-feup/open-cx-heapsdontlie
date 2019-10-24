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
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Theme.of(context).colorScheme.onBackground,
          ),
          margin: const EdgeInsets.all(15.0),        
          child: child,
          )
      ),
    );
  }
}