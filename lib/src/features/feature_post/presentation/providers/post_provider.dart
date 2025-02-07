import 'package:flutter/material.dart';

import '../../domain/entities/post.dart';
import '../../domain/repository/post_repository.dart';

class PostProvider extends ChangeNotifier {
  final PostRepository _postRepository;

  PostProvider({required PostRepository postRepository}) : _postRepository = postRepository;

  List<Post> _posts = [];
  List<Post> get posts => _posts;
  set posts(List<Post> value) {
    _posts = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future getPosts({required int userID}) async {
    try {
      isLoading = true;
      posts = await _postRepository.getPostsByUser(userId: userID);
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
    }
  }

}