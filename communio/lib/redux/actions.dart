import 'package:communio/model/friend.dart';
import 'package:communio/model/person_found.dart';
import 'package:flutter_blue/flutter_blue.dart';

class IncrementCounterAction{
  final int counter;
  IncrementCounterAction(this.counter);
}

class FoundPersonAction{
  final BluetoothDevice device;
  final PersonFound personFound;
  FoundPersonAction(this.device, this.personFound);
}

class QueriedFriendsAction{
  final Set<Friend> friends;
  QueriedFriendsAction(this.friends);
}