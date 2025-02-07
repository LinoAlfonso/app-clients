import 'package:ceiba_users/src/features/feature_users/feature_users.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';

class OnBoardingProvider with ChangeNotifier {

  String? _versionApp;

  String? get versionApp => _versionApp;
  set versionApp(String? value) {
    _versionApp = value;
    notifyListeners();
  }

  Future<void> initialize(BuildContext context) async {
    await getVersion();
    await Future.delayed(const Duration(seconds: 2));
    if (context.mounted) {
      context.goNamed(HomeUsersView.routeName);
    }
  }

  Future<void> getVersion() async {
    final version = await getAppVersion();
    versionApp = version;
  }

}