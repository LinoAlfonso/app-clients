


import '../domain.dart';

abstract class UserDatasource {

  Future<List<User>> getUsers();


}