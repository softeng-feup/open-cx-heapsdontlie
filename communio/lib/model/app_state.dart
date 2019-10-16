import 'package:flutter_blue/flutter_blue.dart';

import 'friend.dart';

class AppState {
  Map content = Map<String, dynamic>();

  Map getInitialContent() {
    return {
      "counter": 0,
      "scanning_on": false,
      "bluetooth_devices": Set<BluetoothDevice>(),
      "friends": List<Friend>()
    };
  }

  AppState(Map content) {
    if (content != null) {
      this.content = content;
    } else {
      this.content = this.getInitialContent();
    }
  }

  AppState cloneAndUpdateValue(key, value) {
    return new AppState(Map.from(this.content)..[key] = value);
  }

  AppState getInitialState() {
    return new AppState(null);
  }
}
