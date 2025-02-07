


import '../domain.dart';

abstract class UserLocalDatasource {

  Future<List<User>> getUsers();


}