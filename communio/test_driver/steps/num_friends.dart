import 'package:flutter_driver/flutter_driver.dart' as driver;
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:test/test.dart';



class NumFriendsStep extends Then1WithWorld<int, FlutterWorld> {
  @override
  Future<void> executeStep(int input1) async{
    final find = driver.find;
    await world.driver.tap(find.byTooltip("Open navigation menu"));
    await world.driver.tap(find.byValueKey("ListConnected"));
    await FlutterDriverUtils.waitForFlutter(world.driver);
    final locator = find.byType("FriendCard");
    await FlutterDriverUtils.isPresent(locator, world.driver);
  }

  @override
  RegExp get pattern => RegExp(r"I expect there to be {int} friends");
}
