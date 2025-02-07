import '../entities/post.dart';

abstract class PostDatasource {

  Future<List<Post>> getPostsByUser({required int userId});

}