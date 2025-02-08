class DBTables {
  static const String users = 'users';

  static const Map<String, String> createTables = {
    users: '''
      CREATE TABLE $users (
        id INTEGER PRIMARY KEY,
        name TEXT,
        username TEXT,
        email TEXT,
        phone TEXT,
        website TEXT
      )
    '''
  };
}