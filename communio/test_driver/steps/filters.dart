import 'package:flutter_driver/flutter_driver.dart' as driver;
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class FiltersStep extends Given1WithWorld<Table, FlutterWorld> {
  @override
  Future<void> executeStep(Table input1) async {
    final columns = input1.asMap();
    final filters = columns.map((filter) => filter['filter']);
    await FlutterDriverUtils.tap(
        world.driver, driver.find.byValueKey('ListConnected'));
    filters.forEach((filter) {});
    return null;
  }

  @override
  // TODO: implement pattern
  RegExp get pattern => null;
}
