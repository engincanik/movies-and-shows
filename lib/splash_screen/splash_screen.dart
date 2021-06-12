import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void changeScreen() {
    Get.offNamed('/home');
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
      () => {Get.offNamed('/home')},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF333333),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 400,
              child: Lottie.asset(
                "assets/splash.json",
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 0),
              child: SizedBox(
                child: Text(
                  'Movies and Shows',
                  style: TextStyle(color: Colors.white70, fontSize: 24.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
