import 'package:flutter/material.dart';
import 'package:hotstar/pages/page1/page1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gotologinpage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          height: screenSize.height * 1.0,
          width: screenSize.width * 1.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 6, 11, 19), // Dark blue color
                Color.fromARGB(255, 36, 5, 193), // Light blue color
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Image.asset(
            color: Colors.white,
            'asset/logodisney.png',
          ),
        ),
      ),
    );
  }

  Future<void> gotologinpage() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => Homepage()));
  }
}
