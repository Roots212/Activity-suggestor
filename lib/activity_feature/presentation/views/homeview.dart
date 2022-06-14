import 'package:activity_suggestor/activity_feature/presentation/bloc/activity_bloc.dart';
import 'package:activity_suggestor/activity_feature/presentation/widgets/emptyWidget.dart';
import 'package:activity_suggestor/activity_feature/presentation/widgets/fetchedWidget.dart';
import 'package:activity_suggestor/activity_feature/presentation/widgets/fetchingWidget.dart';
import 'package:activity_suggestor/activity_feature/presentation/widgets/tapButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(3.0.w),
        child: Column(
          children: [
            SizedBox(
              height: 20.0.h,
            ),
            Row(
              children: [
                Text(
                  'You can ',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20.0.sp,
                      fontFamily: 'Modeseven'),
                ),
                const Spacer()
              ],
            ),
            SizedBox(
              height: 3.0.h,
            ),
            BlocConsumer<ActivityBloc, ActivityState>(
                builder: ((context, state) {
              if (state is Fetching) {
                return const FetchingWidget();
              } else if (state is Fetched) {
                return Column(
                  children: [
                    FetchedWidget(activity: state.activityEntity.activity),
                    SizedBox(
                      height: 20.0.h,
                    ),
                    const TapButtonWidget()
                  ],
                );
              } else if (state is FetchError) {
                return Column(
                  children: [
                    const EmptyWidget(),
                    SizedBox(
                      height: 20.0.h,
                    ),
                    const TapButtonWidget()
                  ],
                );
              }
              return Column(
                children: [
                  const EmptyWidget(),
                  SizedBox(
                    height: 20.0.h,
                  ),
                  const TapButtonWidget()
                ],
              );
            }), listener: (context, state) {
              if (state is FetchError) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.black,
                    duration: Duration(milliseconds: 300),
                    content: Text(
                      'Error, try again',
                      style: TextStyle(color: Colors.white),
                    )));
              }
            }),
          ],
        ),
      ),
    );
  }
}
