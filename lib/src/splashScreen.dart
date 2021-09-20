import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    displaySplash();
  }

  displaySplash() {
    Timer(Duration(seconds: 3), () async {
      Get.offNamed('/homePage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 5),
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.asset(
              'assets/images/logo.png',
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:product_auth_service/src/pages/homePage.dart';

// class SplashScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//       duration: 3000,
//       splash: FlutterLogo(
//         size: 80,
//       ),
//       nextScreen: HomePage(),
//       splashTransition: SplashTransition.fadeTransition,
//       // pageTransitionType: PageTransitionType.scale,
//       backgroundColor: Colors.blue,
//     );
//   }
// }
