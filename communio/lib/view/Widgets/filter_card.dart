import 'package:communio/model/app_state.dart';
import 'package:communio/redux/action_creators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class FilterCard extends StatefulWidget {
  final String filter;

  FilterCard({@required this.filter});

  @override
  _FilterCardState createState() => _FilterCardState(filter);
}

class _FilterCardState extends State<FilterCard> {
  final String filter;
  final verticalPadding = 12.0;
  final horizontalPadding = 12.0;
  final horizontalMargin = 10.0;

  _FilterCardState(this.filter);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        StoreProvider.of<AppState>(context).dispatch(removeFilter(filter));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryVariant,
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin:
            EdgeInsets.only(right: horizontalMargin, left: horizontalMargin),
        child: Container(
            padding: EdgeInsets.only(
                top: verticalPadding,
                bottom: verticalPadding,
                left: horizontalPadding,
                right: horizontalPadding),
            child: Text(
              filter,
              style: Theme.of(context).textTheme.body2.apply(fontSizeDelta: -2),
            )),
      ),
    );
  }
}
