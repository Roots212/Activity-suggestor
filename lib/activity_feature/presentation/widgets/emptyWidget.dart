import 'package:activity_suggestor/activity_feature/presentation/widgets/animatedWidget.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AnimatedWidgetText(animatedText: 'tap below'),
    );
  }
}
