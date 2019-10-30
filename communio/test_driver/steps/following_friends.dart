import 'package:communio/model/app_state.dart';
import 'package:communio/model/friend.dart';
import 'package:gherkin/gherkin.dart';
import 'package:redux/redux.dart';


class GivenFollowingFriends extends Given1<Table>{
  Store<AppState> store;

  GivenFollowingFriends(this.store);

  @override
  Future<void> executeStep(Table input1) {
    final Iterable<Map<String,String>> columns = input1.asMap();
    final Set<Friend> friends = columns.map((friend)=>
    new Friend(
      uuid: friend['uuid'],
      name: friend['name'],
      photo: friend['photo'],
      location: friend['location'],
      interests: friend['interests'].split(',')
    )).toSet();

    store.state.content['friends'] = friends;
    return null;
  }

  @override
  RegExp get pattern => RegExp("rI have the following friends");

}