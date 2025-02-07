import 'dart:async';

import 'package:ceiba_users/src/features/feature_users/presentation/widgets/header_home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../config/config.dart';
import '../../domain/domain.dart';
import '../../feature_users.dart';
import '../widgets/icon_text_custom.dart';
import '../widgets/search_text_field.dart';


class HomeUsersView extends StatefulWidget {
  static const routeName = '/home-users-view';
  const HomeUsersView({super.key});

  @override
  State<HomeUsersView> createState() => _HomeUsersViewState();
}

class _HomeUsersViewState extends State<HomeUsersView> {
  final controllerSearch = TextEditingController();
  final FocusNode focusNode = FocusNode();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controllerSearch.dispose();
    focusNode.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderHome(onTapLogo: (){}, title: 'Ceiba Users'),
      body: Consumer<UsersProvider>(
        builder: (context, usersProvider, child) {
          return Column(
            children: [
              // Search TextField
              Container(
                color: AppColors.primary,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30,bottom: 10),
                  child: SearchTextField(
                    focusNode: focusNode,
                    controller: controllerSearch,
                    hintText: 'Nombre...',
                    onChanged: searchUser,
                    onClear: onClear,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: usersProvider.isLoading?
                const Center(child: CircularProgressIndicator())
                    :
                    usersProvider.users.isEmpty?
                        const Center(
                          child: IconTextCustom(
                            icon: Icons.search_off,
                            text: 'No se encontraron usuarios',
                          ),
                        )
                        :
                ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  itemCount: usersProvider.users.length,
                  itemBuilder: (context, index) {
                    final user = usersProvider.users[index];
                    return UserInfoCard(user: user, onTap: onTapUser);
                  },
                ),
              )
            ],
          );
        }
      ),
    );
  }

  void onTapUser(User user) {
    focusNode.unfocus();
    context.pushNamed(DetailPostUserView.routeName, extra: user);
  }

  void searchUser(String value) {
    final userProvider = context.read<UsersProvider>();
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      userProvider.searchUserByName(value);
    });
  }

  void onClear() {
    final userProvider = context.read<UsersProvider>();
    focusNode.unfocus();
    controllerSearch.clear();
    userProvider.clearSearch();
  }
}