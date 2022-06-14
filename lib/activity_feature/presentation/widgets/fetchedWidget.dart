import 'package:activity_suggestor/activity_feature/presentation/bloc/activity_bloc.dart';
import 'package:activity_suggestor/activity_feature/presentation/widgets/animatedWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class FetchedWidget extends StatelessWidget {
  final String activity;
  const FetchedWidget({Key? key, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: 80.0.w,
          child: InkWell(
              onTap: () {
                BlocProvider.of<ActivityBloc>(context).add(GetActivity());
              },
              child: AnimatedWidgetText(
                animatedText: activity,
              ))),
    );
  }
}
