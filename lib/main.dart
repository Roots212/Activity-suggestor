import 'package:activity_suggestor/activity_feature/presentation/bloc/activity_bloc.dart';
import 'package:activity_suggestor/activity_feature/presentation/views/homeview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shake/shake.dart';
import 'package:sizer/sizer.dart';
import 'injection_container.dart' as ij;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ij.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: ((context, orientation, deviceType) =>
            BlocProvider<ActivityBloc>(
              create: (context) => sl<ActivityBloc>(),
              child: const MaterialApp(
                  title: 'Activity Suggestor',
                  debugShowCheckedModeBanner: false,
                  home: HomeView()),
            )));
  }
}
