
import '../entities/post.dart';

abstract class PostRepository {

  Future<List<Post>> getPostsByUser({required int userId});

}