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
    return Scaffold(
      key: key,
      appBar: AppBar(
        bottom: TabBar(
          tabs: _tabs,
          controller: _tabController,
        ),
      ),
      body: TabBarView(
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
      ),
    );
  }

  Widget _qrscan() {
    return Center(child: Text("hi"));
  }

  Widget _qrcodegenerate() {
    return Center(child: Text("hi"));
  }
}
