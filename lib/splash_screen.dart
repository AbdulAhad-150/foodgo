import 'package:flutter/material.dart';
// import 'package:food_app/bottom/profile_page.dart';
// import 'package:food_app/home.dart';
import 'package:food_app/sign_in.dart';
// import 'package:food_app/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => SignInPage()),
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 255, 145, 137), Colors.red],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        // color: Colors.red,
        child: Stack(
          children: [
            Center(
              child: Text(
                "Foodgo",
                style: TextStyle(
                  fontFamily: 'FontFoodGo',
                  letterSpacing: 2,
                  color: Colors.white,
                  fontSize: 55,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Positioned(
              bottom: -20,
              left: -8,
              child: SizedBox(
                height: 230,
                width: 250, // adjust based on your image sizes
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    // Back image
                    Positioned(
                      left: -10,
                      bottom: -10,
                      child: Image.asset(
                        'assets/images/splashscreen1.png',
                        height: 220,
                      ),
                    ),
                    // Front image slightly overlapping
                    Positioned(
                      left: 80, // Adjust to control overlap
                      bottom: 2,
                      child: Image.asset(
                        'assets/images/splashscreen2.png',
                        height: 140,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
