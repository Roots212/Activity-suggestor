import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AnimatedWidgetText extends StatelessWidget {
  final String animatedText;
  const AnimatedWidgetText({Key? key, required this.animatedText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(animatedText,
            textStyle: TextStyle(
                color: Colors.green,
                fontSize: 30.0.sp,
                fontFamily: 'Modeseven'),
            speed: const Duration(milliseconds: 300))
      ],
      isRepeatingAnimation: false,
    );
  }
}
