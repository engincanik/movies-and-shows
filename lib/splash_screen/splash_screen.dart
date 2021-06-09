import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Check internet connection if true get movies and shows
    // if false go to Home say no connection
    Future.delayed(
      Duration(seconds: 4),
      () => {Get.toNamed('/home')},
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
            )
          ],
        ),
      ),
    );
  }
}
