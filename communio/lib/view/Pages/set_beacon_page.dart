import 'package:communio/model/app_state.dart';
import 'package:communio/redux/action_creators.dart';
import 'package:communio/view/Pages/secondary_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SetBeaconPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SecondaryPageView(
      child: ListView(
        children: <Widget>[
          FlatButton(
            child: Text('Use own phone',
              style: Theme.of(context).textTheme.body2,),
            onPressed: () {
              StoreProvider.of<AppState>(context)
                  .dispatch(startBroadcastingBeacon());
              Navigator.of(context).maybePop();
            },
          )
        ],
      ),
    );
  }
}
