// ignore_for_file: must_be_immutable

import 'package:activity_suggestor/activity_feature/domain/entities/activity_entity.dart';

class ActivityModel extends ActivityEntity {
  @override
  String activity;
  String? type;
  int? participants;
  dynamic? price;
  String? link;
  String? key;
  dynamic? accessibility;

  ActivityModel(
      {required this.activity,
      this.type,
      this.participants,
      this.price,
      this.link,
      this.key,
      this.accessibility})
      : super(activity: activity);

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
        activity: json['activity'],
        type: json['type'],
        participants: json['participants'],
        price: json['price'],
        link: json['link'],
        key: json['key'],
        accessibility: json['accessibility']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activity'] = activity;
    data['type'] = type;
    data['participants'] = participants;
    data['price'] = price;
    data['link'] = link;
    data['key'] = key;
    data['accessibility'] = accessibility;
    return data;
  }
}
