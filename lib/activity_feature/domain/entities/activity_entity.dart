import 'package:equatable/equatable.dart';

class ActivityEntity extends Equatable {
  final String activity;

  ActivityEntity({required this.activity});
  @override
  List<Object?> get props => [activity];
}
