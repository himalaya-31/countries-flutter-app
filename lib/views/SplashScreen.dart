import 'package:countries/utils/Constant.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(seconds: 5), () {
        Navigator.pushReplacementNamed(context, Constant.homeScreenRoute);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(Constant.appIcon),
                  height: 50,
                  width: 50,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  Constant.appName,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
