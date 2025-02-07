
import 'package:ceiba_users/src/features/feature_post/domain/datasource/post_datasource.dart';
import 'package:ceiba_users/src/features/feature_post/domain/entities/post.dart';

import '../../domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDatasource postDatasource;


  PostRepositoryImpl({
    required this.postDatasource,
  });

  @override
  Future<List<Post>> getPostsByUser({required int userId}) {
    return postDatasource.getPostsByUser(userId: userId);
  }


}