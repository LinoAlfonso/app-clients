class UserDBMapper {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  UserDBMapper({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'phone': phone,
      'website': website,
    };
  }

  factory UserDBMapper.fromMap(Map<String, dynamic> map) {
    return UserDBMapper(
      id: map['id'],
      name: map['name'],
      username: map['username'],
      email: map['email'],
      phone: map['phone'],
      website: map['website'],
    );
  }
}