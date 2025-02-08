import '../../domain/domain.dart';
import '../infrastructure.dart';

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
      if (await (localDataSource as UserLocalDatasourceImpl).hasUsers()) {
        print('Local data source has users');
        return await localDataSource.getUsers();
      }

      final users = await remoteDataSource.getUsers();
      print('Remote data source has users');
      await (localDataSource as UserLocalDatasourceImpl).saveUsers(users);
      return users;
    } catch (e) {
      return await localDataSource.getUsers();
    }
  }
}