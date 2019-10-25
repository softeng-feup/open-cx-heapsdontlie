import 'package:communio/model/friend.dart';
import 'package:communio/model/person_found.dart';

class IncrementCounterAction{
  final int counter;
  IncrementCounterAction(this.counter);
}

class FoundPersonAction{
  final String uuid;
  final PersonFound personFound;
  FoundPersonAction(this.uuid, this.personFound);
}

class QueriedFriendsAction{
  final Set<Friend> friends;
  QueriedFriendsAction(this.friends);
}
class NewFiltersAction{
  final Set<String> filters;
  NewFiltersAction(this.filters);
}

class ActivateScanning{}
