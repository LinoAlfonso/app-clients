
import '../../domain/domain.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource remoteDataSource;
  final UserLocalDatasource localDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<User>> getUsers() async {
    try {
      final users = await remoteDataSource.getUsers();
      return users;
    } on Exception {
      final users = await localDataSource.getUsers();
      return users;
    }
  }
}