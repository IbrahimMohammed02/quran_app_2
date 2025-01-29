import 'package:flutter/material.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/routes_manager/routes_manager.dart';
// import 'package:islami_c13_offline/core/resources/assets_manager.dart';
// import 'package:islami_c13_offline/core/routes_manager/routes_manager.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        AssetImages.splashImage,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, RoutesManager.home);
        }
      },
    );
  }
}
