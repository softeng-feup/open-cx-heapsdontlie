import 'package:logger/logger.dart';

import '../model/app_state.dart';
import 'actions.dart';

AppState appReducers(AppState state, dynamic action) {
  if(action is IncrementCounterAction){
    return incrementCounter(state, action);
      }
      return state;
}
    
AppState incrementCounter(AppState state, IncrementCounterAction action) {
  Logger().i('setting counter to ${action.counter}');
  return state.cloneAndUpdateValue('counter', action.counter);
}