import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:product_auth_service/src/controllers/QRCodeController.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _qrcodeC = Get.put(QRCodeController());

  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Auth Service'),
        centerTitle: true,
      ),
      body: PageView(
        children: [
          Obx(
            () => Container(
              // height: Get.height,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15.0,
                  ),
                  TextField(
                    onChanged: _qrcodeC.qrCode,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 15.0,
                        ),
                        labelText: 'QR Code',
                        labelStyle: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                        hintText: 'enter product code',
                        hintStyle: TextStyle(
                          color: Theme.of(context).focusColor.withOpacity(0.7),
                        ),
                        prefixIcon: Icon(
                          Icons.qr_code,
                          color: Theme.of(context).accentColor,
                        ),
                        // errorBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //     color: Colors.red,
                        //     width: 2.0,
                        //     style: BorderStyle.solid,
                        //   ),
                        //   borderRadius: BorderRadius.circular(6.0),
                        // ),
                        // errorText: 'Please enter valid QR code',
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        )

                        // filled: true,
                        ),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () => scanBarcodeNormal(),
                        child: Text(
                          'Scan Barcode',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        shape: StadiumBorder(),
                        color: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 40),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      MaterialButton(
                        onPressed: () => scanQR(),
                        child: Text(
                          'Scan QR',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        shape: StadiumBorder(),
                        color: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 60),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Scan result : $_scanBarcode\n',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  MaterialButton(
                    onPressed: _qrcodeC.qrCode.value.isEmpty
                        ? () {
                            print('No Data');
                          }
                        : () {
                            print(_qrcodeC.qrCode.value);
                          },
                    child: Text(
                      'Verify',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    shape: StadiumBorder(),
                    color: Colors.black.withOpacity(1),
                    padding: EdgeInsets.symmetric(horizontal: 68),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
