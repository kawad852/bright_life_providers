import 'package:flutter/material.dart';

class BlurImage extends StatelessWidget {
  const BlurImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          radius: 1,
          center: Alignment.topRight,
          colors: [
            Color(0xFF90C8AC),
            Color(0xFFFFFFFF),
          ],
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
    );
  }
}
