import 'package:flutter/material.dart';

class HomeUsersView extends StatelessWidget {
  static const routeName = '/home-users-view';
  const HomeUsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home Users Screen'),
      ),
    );
  }
}