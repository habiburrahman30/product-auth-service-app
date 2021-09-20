import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Status { Error, Success }

class GetHelper {
  showSnackbar({required String msg, required Status status}) {
    if (Get.isSnackbarOpen == false) {
      Get.snackbar(
        status == Status.Success ? 'Success!!!' : 'Oops!!!',
        msg,
        icon: status == Status.Success
            ? Icon(
                Icons.done_all,
                color: Colors.white,
              )
            : Icon(
                Icons.error_outline,
                color: Colors.red,
              ),
        colorText: Colors.white,
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
