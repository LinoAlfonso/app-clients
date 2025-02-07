
import 'package:flutter/material.dart';

import '../../domain/domain.dart';

class UsersProvider with ChangeNotifier {

  final UserRepository _userRepository;
  UsersProvider({required UserRepository userRepository}) : _userRepository = userRepository{
    getUsers();
  }

  bool _isSearching = false;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<User> _usersStatic = [];

  List<User> _users = [];
  List<User> get users => _filtersUser.isNotEmpty? _filtersUser:  _users;
  set users(List<User> value) {
    _users = value;
    notifyListeners();
  }

  List<User> _filtersUser = [];
  set filtersUser(List<User> value) {
    _filtersUser = value;
    notifyListeners();
  }


  Future getUsers() async {
    try {
      isLoading = true;
      users = await _userRepository.getUsers();
      _usersStatic = users;
    } catch (e) {
      print("Eroror ----------------------------$e");
    } finally {
      isLoading = false;
    }
  }


  /*
  * Search user by name in local list
   */
  void searchUserByName(String name) {
    _isSearching = name.isNotEmpty;
    if (_isSearching) {
      isLoading = true;
      filtersUser = [];
      final searchResults = _users.where((user) =>
      user.name.toLowerCase().contains(name.toLowerCase())??false).toList();
      if (searchResults.isNotEmpty) {
        isLoading = false;
        filtersUser = searchResults;
      } else {
        isLoading = false;
        users = [];
        filtersUser = [];
      }
    } else {
      clearSearch();
    }
  }

  void clearSearch() {
    _isSearching = false;
    filtersUser = [];
    users = _usersStatic;
  }

}