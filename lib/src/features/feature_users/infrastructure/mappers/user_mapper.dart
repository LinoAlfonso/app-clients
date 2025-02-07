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
      address: AddressMapper.jsonToEntity(json['address']),
      company: CompanyMapper.jsonToEntity(json['company']),
    );
  }
}