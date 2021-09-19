import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:product_auth_service/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GlobalConfiguration().loadFromAsset("configurations");
  print("base_url: ${GlobalConfiguration().getValue('base_url')}");
  print("api_base_url: ${GlobalConfiguration().getValue('api_base_url')}");
  runApp(App());
}
