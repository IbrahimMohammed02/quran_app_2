// import 'package:carousel_slider/carousel_options.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../../core/resources/app_styles.dart';
// import '../../../../../core/resources/assets_manager.dart';
//
// class TasbehTab extends StatelessWidget {
//   const TasbehTab({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: const BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage(AssetImages.tasbehback),
//               fit: BoxFit.cover)),
//       child: Column(
//         children: [
//           Image.asset(AssetImages.islamiLogo),
//           // buildSearchField(),
//           const SizedBox(
//             height: 20,
//           ),
//           const Text(
//             'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
//             style: AppStyles.whiteBold20,
//           ),
//
//         ],
//       ),
//     );
//   }
// }

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import '../../../../../core/resources/app_styles.dart';
import '../../../../../core/resources/assets_manager.dart';

class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  _TasbehTabState createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> with SingleTickerProviderStateMixin {
  int _count = 0;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      lowerBound: 0.9,
      upperBound: 1.0,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  void _incrementCounter() {
    if (_count < 33) {
      setState(() {
        _count++;
      });
      _controller.forward().then((_) => _controller.reverse());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetImages.tasbehback),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Image.asset(AssetImages.islamiLogo),
          const SizedBox(height: 10),
          const Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
            style: AppStyles.whiteBold26,
          ),

          const SizedBox(height: 120),
          GestureDetector(
            onTap: _incrementCounter,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value,
                  child: CustomPaint(
                    size: const Size(200, 200),
                    painter: BeadsPainter(),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "سبحان الله",
                            style:  AppStyles.whiteBold22,
                            ),

                          Text(
                            "$_count",
                            style:  AppStyles.whiteBold26,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BeadsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.amber;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.width / 2.5;

    for (int i = 0; i < 33; i++) {
      double angle = (2 * pi * i) / 33;
      double x = centerX + radius * cos(angle);
      double y = centerY + radius * sin(angle);
      canvas.drawCircle(Offset(x, y), 10, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

