import 'package:communio/model/person_found.dart';
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
  } else if (action is NewFiltersAction){
    return addNewFilter(state, action);
  } else if (action is ActivateScanning) {
    return activateScanning(state);
  }
  return state;
}

AppState activateScanning(AppState state) {
  return state.cloneAndUpdateValue('scanning_on', true);
}

AppState addNewFilter(AppState state, NewFiltersAction action) {
  Logger().i('Filters are now ${action.filters}');
  return state.cloneAndUpdateValue('current_filters', action.filters);
}

AppState addNewdevice(AppState state, FoundPersonAction action) {
  Logger().i('Adding a new person of '
      'id ${action.uuid} and name ${action.personFound.name}');
  final Map<String, PersonFound> bluetoothDevices =
      state.content['bluetooth_devices'];
  bluetoothDevices.putIfAbsent(action.uuid, () => action.personFound);
  return state.cloneAndUpdateValue('bluetooth_devices', bluetoothDevices);
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
