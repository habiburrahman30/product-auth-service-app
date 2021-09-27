import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:product_auth_service/src/controllers/barcodeController.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final qrTextController = TextEditingController(text: '');
  final _qrcodeC = Get.put(BarcodeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Auth Service'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _qrcodeC.reset();
              setState(() {
                qrTextController.text = '';
              });
            },
            color: Colors.red,
            icon: Icon(Icons.refresh),
          ),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => _qrcodeC.isRefreshing.value == true
                ? Center(child: CircularProgressIndicator())
                : Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      elevation: 6,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 15.0,
                            ),
                            TextField(
                              controller: qrTextController,
                              onChanged: _qrcodeC.qrCode,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 15.0,
                                ),
                                labelText: 'Barcode Code',
                                labelStyle: TextStyle(
                                  color: Theme.of(context).accentColor,
                                ),
                                hintText: 'enter product code',
                                hintStyle: TextStyle(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.7),
                                ),
                                prefixIcon: Icon(
                                  Icons.qr_code,
                                  color: Theme.of(context).accentColor,
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                            SizedBox(
                              height: 25.0,
                            ),

                            _qrcodeC.qrCode.value.isNotEmpty
                                ? MaterialButton(
                                    onPressed: _qrcodeC.qrCode.value.isEmpty
                                        ? () {
                                            print('No Data');
                                          }
                                        : () {
                                            print(_qrcodeC.qrCode.value);
                                            _qrcodeC.matchUniqueCode();
                                          },
                                    child: Text(
                                      'Verify',
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                    shape: StadiumBorder(),
                                    color: Colors.black.withOpacity(1),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 68),
                                  )
                                : MaterialButton(
                                    onPressed: () async {
                                      final res = await _qrcodeC.scanQR();
                                      setState(() {
                                        _qrcodeC.qrCode.value = res;
                                        qrTextController.text = res;
                                      });
                                    },
                                    child: Text(
                                      'Scan Code',
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                    shape: StadiumBorder(),
                                    color: Colors.blue,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Get.width / 9),
                                  ),
                            // SizedBox(
                            //   height: 15.0,
                            // ),
                            // Text(
                            //   'Scan result : ${_qrcodeC.qrCode.value}\n',
                            //   style: TextStyle(fontSize: 20),
                            // ),
                            // SizedBox(
                            //   height: 15.0,
                            // ),
                            // MaterialButton(
                            //   onPressed: _qrcodeC.qrCode.value.isEmpty
                            //       ? () {
                            //           print('No Data');
                            //         }
                            //       : () {
                            //           print(_qrcodeC.qrCode.value);
                            //         },
                            //   child: Text(
                            //     'Verify',
                            //     style: TextStyle(color: Theme.of(context).primaryColor),
                            //   ),
                            //   shape: StadiumBorder(),
                            //   color: Colors.black.withOpacity(1),
                            //   padding: EdgeInsets.symmetric(horizontal: 68),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
