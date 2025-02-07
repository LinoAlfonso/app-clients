
import '../config.dart';

class ApiRoutes {

  static final String baseUrl                       = Environment.apiUrl;

  static final String getUsers                      = '${baseUrl}users';
  static final String getPostByUser                 = '${baseUrl}posts';
}