import 'package:ceiba_users/src/features/feature_users/infrastructure/mappers/user_db_mapper.dart';

import '../../domain/domain.dart';
import '../infrastructure.dart';

class UserMapper {
  static User jsonToEntity(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
    );
  }

  static User dbModelToEntity(UserDBMapper dbModel) {
    return User(
      id: dbModel.id,
      name: dbModel.name,
      username: dbModel.username,
      email: dbModel.email,
      phone: dbModel.phone,
      website: dbModel.website,
    );
  }

  static UserDBMapper entityToDBModel(User user) {
    return UserDBMapper(
      id: user.id,
      name: user.name,
      username: user.username,
      email: user.email,
      phone: user.phone,
      website: user.website,
    );
  }
}