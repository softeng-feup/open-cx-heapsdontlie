import 'package:communio/model/app_state.dart';
import 'package:communio/redux/action_creators.dart';
import 'package:communio/view/Pages/general_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_redux/flutter_redux.dart';

class PeopleSearchingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    StoreProvider.of<AppState>(context).dispatch(scanForDevices());
    return GeneralPageView(
      child: Container(
        child: this.buildDevices(context),
      )
    );
  }

  Widget buildDevices(BuildContext context) {
    return StoreConnector<AppState, Set<BluetoothDevice>>(
      converter: (store) => store.state.content['bluetooth_devices'],
      builder: (context, devices){
        final List<BluetoothDevice> devicesList = devices.toList();
        return ListView(
          shrinkWrap: false,
          padding: EdgeInsets.all(20.0),
          children: this.generateDevicesCards(devicesList),
        );
      },
    );
  }

  generateDevicesCards(List<BluetoothDevice> devices) {
    final List<Widget> devicesCards = List();
    devices.forEach((device){
      devicesCards.add(
        new Card(
          child: Text('Device id: ${device.id}'),
        )
      );
    });
    return devicesCards;
  }

}