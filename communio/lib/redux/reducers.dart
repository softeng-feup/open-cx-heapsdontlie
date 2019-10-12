import 'package:flutter_blue/flutter_blue.dart';
import 'package:logger/logger.dart';

import '../model/app_state.dart';
import 'actions.dart';

AppState appReducers(AppState state, dynamic action) {
  if(action is IncrementCounterAction){
    return incrementCounter(state, action);
  } else if(action is BluetoothDeviceAction){
    return addNewdevice(state, action);
  }
  return state;
}
    
AppState addNewdevice(AppState state, BluetoothDeviceAction action) {
  final Set<BluetoothDevice> devices = state.content['bluetooth_devices'];
  if(!devices.contains(action.device)){
    Logger().i('Adding a new bluetooth device of id ${action.device.id}');
    devices.add(action.device);
    return state.cloneAndUpdateValue('bluetooth_devices', devices);
  }
  return state;
}
    
AppState incrementCounter(AppState state, IncrementCounterAction action) {
  Logger().i('setting counter to ${action.counter}');
  return state.cloneAndUpdateValue('counter', action.counter);
}