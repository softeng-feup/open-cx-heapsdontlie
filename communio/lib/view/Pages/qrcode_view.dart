import 'package:communio/view/Pages/general_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:path/path.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _QRCodePage();
}

class _QRCodePage extends State<QRCodePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> _tabs = <Tab>[Tab(text: "SCAN"), Tab(text: "QRCODE")];
  bool _enteredInScantab = false;
  String _scanned = "N/A";
  AssetImage icon = AssetImage("assets/icon/icon.png");

  GlobalKey key = GlobalKey();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, length: _tabs.length, initialIndex: 1);
    _tabController.addListener(this._qrscanlistener);
    _tabController.addListener(this._qrgenlistener);
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
              Expanded(child: _tabviews(context))
            ])));
  }

  _qrscanlistener() {
    setState(() {
      if (this._tabController.index == 0 && !this._enteredInScantab) {
        this._enteredInScantab = true;
        _scanqrcode();
      }
    });
  }

  _qrgenlistener() {
    setState(() {
      if (this._tabController.index == 1) {
        this._enteredInScantab = false;
      }
    });
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
            return _qrcodegenerate(context);
        }
      }).toList(),
    );
  }

  Widget _qrscan() {
    return Center(child: Text(_scanned)   );
  }

  Future<void> _scanqrcode() async {
    String barcodeScanRes;

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = 'PLATFORM_EXCEPTION_ERROR';
    }

    if (!mounted) return;

    setState(() {
      _scanned = (barcodeScanRes=="-1") ? _scanned : barcodeScanRes ;
    });
  }

  Widget _qrcodegenerate(BuildContext context) {
    final QrImage qrcode = QrImage(
      data: "PLACE_HOLDER_FOR_1_ON_1_CONNECTION",
      version: QrVersions.auto,
      size: 325,
      embeddedImage: icon,
      embeddedImageStyle: QrEmbeddedImageStyle(size: Size(80, 80)),
      errorStateBuilder: (cxt, err) {
        return Container(
          child: Center(
            child: Text(
              "Uh oh! Something went wrong...",
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );

    return Center(child: qrcode);
  }
}
