import 'dart:async';

import 'package:flutter/material.dart';

import '../default_text.dart';
import '../login/Login_Screen.dart';
import '../styles/colors.dart';
import 'home_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late final AnimationController _slideController;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      animationBehavior: AnimationBehavior.preserve,
      value: 1,
      vsync: this,
    )..repeat(reverse: true);

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, 1.0),
    ).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.ease),
    );

    Timer(
      const Duration(milliseconds: 10000),
          () {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
          return  LoginScreen();

        }

        ));

      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Stack(
        children: [
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 300,),
            duration: const Duration(milliseconds: 3000),
            builder: (BuildContext context, double? value, Widget? child) =>
                Container(color: Colors.white,


                ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _animation,
                  child: Image.asset(
                    fit: BoxFit.fill,


                    'assets/logo.png',
                    height: 200,
                    width: 200,
                  ),
                ),
                SlideTransition(
                  position: _slideAnimation,
                  child: const DefaultText(
                    text: 'EMERGENCY',
                    color: Colors.lightBlueAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
