import 'package:flutter/material.dart';

class ConstructivistIllustration extends StatelessWidget {
  const ConstructivistIllustration({super.key, this.height = 220});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Transform.rotate(
              angle: -0.35,
              child: Container(
                width: 150,
                height: 150,
                color: Colors.black,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 110,
              height: 110,
              decoration: const BoxDecoration(
                color: Color(0xFFD72638),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: 190,
              height: 60,
              color: const Color(0xFFFFC857),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              color: const Color(0xFFF4EBDC),
              child: const Text(
                'ФОРМА\nРИТМ\nДВИЖЕНИЕ',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  height: 0.95,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
