import 'package:communio/model/person_found.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:communio/main.dart' as app;

void main() {

  final person1 = PersonFound(
      name: "John Doe",
      photo: "https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80",
      location: "Portugal",
      interests: ["Big Data", "AI"]);
  final person2 = PersonFound(
      name: "John Doe",
      photo: "https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80",
      location: "Portugal",
      interests: ["Big Data"]);
  
  final  people = Map.fromIterables(
      ["key1", "key2"], [person1, person2]);

  app.state.state.content['bluetooth_devices'] = people;
  app.state.state.content['scanning_on'] = true;
  enableFlutterDriverExtension();
  app.main();
}