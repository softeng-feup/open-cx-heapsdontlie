import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'steps/connected_people.dart';
import 'steps/filters.dart';
import 'steps/num_friends.dart';
import 'steps/num_people.dart';
import 'steps/tap_button.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/**.feature")]
    ..reporters = [ProgressReporter(), TestRunSummaryReporter()]
    ..stepDefinitions = [
      TapButtonNTimesStep(),
      NumFriendsStep(),
      FiltersStep(),
      ConnectedPeopleStep(),
      NumPeopleStep()
    ]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app.dart"
    ..exitAfterTestRun = true; // set to false if debugging to exit cleanly
  return GherkinRunner().execute(config);
}
