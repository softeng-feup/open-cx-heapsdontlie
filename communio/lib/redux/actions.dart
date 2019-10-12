

import 'package:flutter_blue/flutter_blue.dart';

class IncrementCounterAction{
  final int counter;
  IncrementCounterAction(this.counter);
}

class BluetoothDeviceAction{
  final BluetoothDevice device;
  BluetoothDeviceAction(this.device);
}