import 'package:activity_suggestor/activity_feature/presentation/widgets/animatedWidget.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FetchingWidget extends StatelessWidget {
  const FetchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [AnimatedWidgetText(animatedText: '...')],
      ),
    );
  }
}
