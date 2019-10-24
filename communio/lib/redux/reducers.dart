import 'package:communio/model/friend.dart';
import 'package:communio/model/person_found.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:logger/logger.dart';
import '../model/app_state.dart';
import 'actions.dart';

AppState appReducers(AppState state, dynamic action) {
  if (action is IncrementCounterAction) {
    return incrementCounter(state, action);
  } else if (action is FoundPersonAction) {
    return addNewdevice(state, action);
  } else if (action is QueriedFriendsAction) {
    return replaceFriends(state, action);
  }
  return state;
}

AppState addNewdevice(AppState state, FoundPersonAction action) {
  Logger().i('Adding a new person of '
      'id ${action.device.id} and name ${action.personFound.name}');
  final Map<BluetoothDevice, PersonFound> bluetoothDevices =
      state.content['bluetooth_devices'];
  bluetoothDevices.putIfAbsent(action.device, () => action.personFound);    
  return state.cloneAndUpdateValue(
    'bluetooth_devices',
    bluetoothDevices
  );
}

AppState incrementCounter(AppState state, IncrementCounterAction action) {
  Logger().i('setting counter to ${action.counter}');
  return state.cloneAndUpdateValue('counter', action.counter);
}

AppState replaceFriends(AppState state, QueriedFriendsAction action) {
  Logger().i('Found ${action.friends.length} friends:'
      '${action.friends}');
  return state.cloneAndUpdateValue('friends', action.friends);
}
