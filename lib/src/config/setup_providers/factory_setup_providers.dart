
import '../../features/feature_post/feature_post.dart';
import '../../features/feature_users/domain/domain.dart';
import '../../features/feature_users/infrastructure/infrastructure.dart';
import '../../features/feature_users/presentation/presentation.dart';

class FactorySetupProviders {

/*Provider user*/

  static UserDatasource createUserDatasource() {
    return UserDatasourceImpl();
  }

  static UserLocalDatasource createUserLocalDatasource() {
    return UserLocalDatasourceImpl();
  }

  static UserRepository createUserRepository() {
    return UserRepositoryImpl(remoteDataSource: createUserDatasource(), localDataSource: createUserLocalDatasource());
  }

  static UsersProvider createUserProvider() {
    return UsersProvider(userRepository: createUserRepository());
  }

  /*Provider post*/

  static PostDatasource createPostDatasource() {
    return PostDatasourceImpl();
  }

  static PostRepository createPostRepository() {
    return PostRepositoryImpl(postDatasource: createPostDatasource());
  }

  static PostProvider createPostProvider() {
    return PostProvider(postRepository: createPostRepository());
  }


}
