
import '../../domain/domain.dart';

class CompanyMapper {
  static Company jsonToEntity(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }
}