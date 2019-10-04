import 'dart:async';
import 'package:redux_thunk/redux_thunk.dart';
import '../model/app_state.dart';
import 'actions.dart';
import 'package:redux/redux.dart';

ThunkAction<AppState> incrementCounter() {
  return (Store<AppState> store) async {
    final Future<int> futurIncrementCounter = Future.delayed(
        Duration(seconds: 2), () => store.state.content['counter'] + 1);
    final int incrementCounter = await futurIncrementCounter;
    store.dispatch(IncrementCounterAction(incrementCounter));
  };
}
