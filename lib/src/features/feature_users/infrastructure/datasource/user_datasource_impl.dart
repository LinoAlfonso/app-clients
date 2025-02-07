
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../config/config.dart';
import '../../domain/domain.dart';
import '../infrastructure.dart';

class UserDatasourceImpl implements UserDatasource {
  @override
  Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(ApiRoutes.getUsers));
      if (response.statusCode == 200) {
        final List<User> users = jsonDecode(response.body)
            .map<User>((user) => UserMapper.jsonToEntity(user))
            .toList();
        return users;
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Failed to load users');
    }
  }

}