
import '../domain.dart';

abstract class UserRepository {

  Future<List<User>> getUsers();


}