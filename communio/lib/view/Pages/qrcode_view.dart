import 'package:communio/view/Pages/general_page_view.dart';
import 'package:flutter/material.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _QRCodePage();
}

class _QRCodePage extends State<QRCodePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> _tabs = <Tab>[Tab(text: "SCAN"), Tab(text: "QRCODE")];

  GlobalKey key = GlobalKey();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPageView(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Column(children: [
              Card(child: _tabbar(context)),
              Expanded(child:_tabviews(context))
            ])));
  }

  Widget _tabbar(BuildContext context) {
    return TabBar(
      tabs: _tabs,
      controller: _tabController,
      labelColor: Theme.of(context).primaryColor,
      unselectedLabelColor: Theme.of(context).primaryColorLight,
      indicatorColor: Theme.of(context).primaryColor,
    );
  }

  Widget _tabviews(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: _tabs.map((Tab tab) {
        final String label = tab.text;
        switch (label) {
          case 'SCAN':
            return _qrscan();
          case 'QRCODE':
            return _qrcodegenerate();
        }
      }).toList(),
    );
  }

  Widget _qrscan() {
    return Center(child: Text("hi"));
  }

  Widget _qrcodegenerate() {
    return Center(child: Text("hi"));
  }
}
