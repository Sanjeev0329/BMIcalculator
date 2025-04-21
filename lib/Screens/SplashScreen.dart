import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_flutterapp/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    // Delay the animation a bit
    Timer(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Navigate to main screen
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomepage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(seconds: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: Duration(seconds: 2),
                builder: (context, value, child) => Transform.scale(
                  scale: value,
                  child: child,
                ),
                child: Column(
                  children: [
                    Text(
                      'BMI Calculator',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.orange.shade700,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'For you',
                      style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        color: Colors.orange.shade400,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              CircularProgressIndicator(
                color: Colors.orange,
                strokeWidth: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
