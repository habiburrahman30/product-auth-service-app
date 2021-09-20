import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:product_auth_service/src/helpers/getHelper.dart';
import 'package:product_auth_service/src/helpers/helper.dart';

class BarcodeController extends GetxController with GetHelper {
  // final _getHelper = GetHelper();
  final qrCode = ''.obs;
  final _dio = Dio();
  final isRefreshing = false.obs;

  reset() async {
    isRefreshing.value = true;
    await Future.delayed(Duration(seconds: 1));
    qrCode.value = '';
    isRefreshing.value = false;
  }

  Future<String> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.DEFAULT);
      return barcodeScanRes;
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    return barcodeScanRes;
  }

  //=============================

  Future<void> matchUniqueCode() async {
    try {
      Uri uri = Helper.getUri('api/unique-code/${qrCode.value}');
      print(uri);
      final res = await _dio.post(
        '$uri',
        options: Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
          },
        ),
      );
      switch (res.data['status']) {
        case 200:
          showSnackbar(msg: res.data['msg'], status: Status.Success);
          break;
        default:
          showSnackbar(msg: res.data['msg'], status: Status.Error);
      }
    } on DioError catch (e) {
      print(e.response);
    }
  }
}
