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
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        title: new Text(
          'Commun.io',
          style: Theme.of(context).textTheme.subhead,
        ),
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