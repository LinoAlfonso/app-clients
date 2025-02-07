
import '../../domain/entities/post.dart';

class PostMapper {
  static Post fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      userId: json['userId'],
    );
  }

  static Map<String, dynamic> toJson(Post post) {
    return {
      'id': post.id,
      'title': post.title,
      'body': post.body,
      'userId': post.userId,
    };
  }
}