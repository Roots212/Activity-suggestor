import 'package:activity_suggestor/activity_feature/presentation/bloc/activity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class TapButtonWidget extends StatefulWidget {
  const TapButtonWidget({Key? key}) : super(key: key);

  @override
  State<TapButtonWidget> createState() => _TapButtonWidgetState();
}

class _TapButtonWidgetState extends State<TapButtonWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat(reverse: true);
    _animation = CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
        BlocProvider.of<ActivityBloc>(context).add(GetActivity());
      },
      child: Center(
        child: FadeTransition(
            opacity: _animation,
            child: Text(
              'Tap here',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0.sp,
                  fontFamily: 'Modeseven'),
            )),
      ),
    );
  }
}
