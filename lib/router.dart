import 'package:get/get.dart';

import 'src/pages/homePage.dart';
import 'src/pages/loginPage.dart';
import 'src/splashScreen.dart';

class RouterForApp {
  static final route = [
    GetPage(
      name: '/splashView',
      transition: Transition.upToDown,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: '/homePage',
      page: () => HomePage(),
    ),
    GetPage(
      name: '/login',
      transition: Transition.downToUp,
      page: () => LoginPage(),
    ),
  ];
}
