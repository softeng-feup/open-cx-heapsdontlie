import 'package:communio/model/app_state.dart';
import 'package:communio/model/person_found.dart';
import 'package:communio/redux/action_creators.dart';
import 'package:communio/view/Pages/general_page_view.dart';
import 'package:communio/view/Widgets/filters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_redux/flutter_redux.dart';

class PeopleSearchingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StoreProvider.of<AppState>(context).dispatch(scanForDevices());
    return GeneralPageView(
        child: Container(
      child: this.buildDevices(context),
    ));
  }

  Widget buildDevices(BuildContext context) {
    return StoreConnector<AppState, Map<BluetoothDevice, PersonFound>>(
      converter: (store) => getFilteredDevices(store.state),
      builder: (context, devices) {
        return ListView(
          shrinkWrap: false,
          padding: EdgeInsets.all(20.0),
          children: this.generateDevicesCards(devices),
        );
      },
    );
  }

  Map<BluetoothDevice, PersonFound> getFilteredDevices(AppState state) {
    final storeContent = state.content;
    final Set<String> filters = storeContent['current_filters'];
    final Map<BluetoothDevice, PersonFound> devices =
        storeContent['bluetooth_devices'];
    final Map<BluetoothDevice, PersonFound> filteredDevices = Map.from(devices)
      ..removeWhere((key, value) => !value.interests
          .any((value) => filters.contains(value) || filters.length == 0));
    return filteredDevices;
  }

  generatePersonCard(PersonFound person) {
    return new Card(
        child: Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(person.photo),
          minRadius: 30,
        )
      ],
    ));
  }

  generateDevicesCards(Map<BluetoothDevice, PersonFound> devices) {
    final List<Widget> devicesCards = List();
    devicesCards.add(new Filters());
    devices.forEach((device, person) {
      devicesCards.add(this.generatePersonCard(person));
    });
    return devicesCards;
  }
}
