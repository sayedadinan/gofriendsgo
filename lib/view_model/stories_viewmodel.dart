import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gofriendsgo/model/story_model/story_model.dart';
import 'package:gofriendsgo/services/shared_preferences.dart';
import 'package:gofriendsgo/services/story_service.dart';

class StoriesViewModel extends ChangeNotifier {
  final StoryService _service = StoryService();
  StoriesModel? _storiesResponse;
  bool _isLoading = false;

  StoriesModel? get storiesResponse => _storiesResponse;
  bool get isLoading => _isLoading;

  fetchStories() async {
    _isLoading = true;
    notifyListeners();

    try {
      _storiesResponse = await _service.fetchStories(SharedPreferecesServices.token!);
      if (_storiesResponse != null) {
        log('Stories fetched successfully');
        // For example, logging the title of the first story item if it exists
        if (_storiesResponse!.data.stories.isNotEmpty) {
          log(_storiesResponse!.data.stories[0].title);
        }
      }
      return _storiesResponse;
    } catch (e) {
      // Handle error
      log('Error fetching stories: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
