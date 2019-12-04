import 'package:communio/model/app_state.dart';
import 'package:communio/redux/action_creators.dart';
import 'package:communio/view/Pages/general_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GeneralPageView(
      child: createScrollableCardView(context),
    );
  }

  Widget createScrollableCardView(BuildContext context) {
    return StoreConnector<AppState, int>(
      converter: (store) => store.state.content['counter'],
      builder: (context, counter) {
        return Container(
          height: MediaQuery.of(context).size.height,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/icon/icon.png'),
                  )),
                )
              ]),
        );
      },
    );
  }

  Widget createActionButton(BuildContext context) {
    return new FloatingActionButton(
      onPressed: () =>
          {StoreProvider.of<AppState>(context).dispatch(incrementCounter())},
      tooltip: 'Increment',
      child: new Icon(Icons.add),
    );
  }
}
