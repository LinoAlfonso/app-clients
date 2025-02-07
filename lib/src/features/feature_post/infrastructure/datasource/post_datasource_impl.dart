
import 'dart:convert';

import 'package:ceiba_users/src/features/feature_post/infrastructure/mapper/post_mapper.dart';
import 'package:http/http.dart' as http;
import 'package:ceiba_users/src/features/feature_post/domain/entities/post.dart';
import '../../../../config/config.dart';
import '../../domain/datasource/post_datasource.dart';

class PostDatasourceImpl implements PostDatasource {
  @override
  Future<List<Post>> getPostsByUser({required int userId}) async {
    try {
      final uri = Uri.parse(ApiRoutes.getPostByUser).replace(queryParameters: {
        'userId': userId.toString(),
      });
      print('uri--------------post: $uri');
      final response = await http.get(uri, headers: ApiHeaders.headers).timeout(ApiHeaders().timeOut).catchError((value) {
        throw Exception('Error de timeout');
      });
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((e) => PostMapper.fromJson(e)).toList();

      } else {
        throw 'Error al obtener los posts del usuario';
      }
    } catch (e) {
      throw 'Error al obtener los posts del usuario $e';
    }
  }

}