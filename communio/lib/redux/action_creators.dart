import 'dart:async';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:logger/logger.dart';
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

ThunkAction<AppState> scanForDevices() {
  return (Store<AppState> store) {
    if (!store.state.content['scanning_on']) {
      final bluetooth = FlutterBlue.instance;
      Logger().i('Starting to scan for devices...');
      bluetooth.scan().listen((scanResult) {
        store.dispatch(BluetoothDeviceAction(scanResult.device));
      });
    }
  };
}
