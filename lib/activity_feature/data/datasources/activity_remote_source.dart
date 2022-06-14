import 'dart:convert';

import 'package:activity_suggestor/activity_feature/data/models/activitymodel.dart';
import 'package:activity_suggestor/core/error/exceptions.dart';
import 'package:http/http.dart';

abstract class ActivityRemoteSource {
  Future<ActivityModel> getActivitySuggestion();
}

class ActivityRemoteSourceImpl implements ActivityRemoteSource {
  @override
  Future<ActivityModel> getActivitySuggestion() => _getActivityFromUrl(
      'http://www.boredapi.com/api/activity?participants=1');

  Future<ActivityModel> _getActivityFromUrl(String url) async {
    final response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      return ActivityModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
