import '../../domain/domain.dart';

class AddressMapper {
  static Address jsonToEntity(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
    );
  }

  static Map<String, dynamic> entityToJson(Address entity) {
    return {
      'street': entity.street,
      'suite': entity.suite,
      'city': entity.city,
      'zipcode': entity.zipcode,
    };
  }
}