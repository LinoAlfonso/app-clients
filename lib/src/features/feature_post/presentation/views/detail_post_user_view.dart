import 'package:ceiba_users/src/config/config.dart';
import 'package:ceiba_users/src/features/feature_post/presentation/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../feature_users/domain/domain.dart';
import '../widgets/post_user.dart';

class DetailPostUserView extends StatefulWidget {
  final User user;
  static const routeName = '/detail-post-user';
  const DetailPostUserView({super.key, required this.user});

  @override
  State<DetailPostUserView> createState() => _DetailPostUserViewState();
}

class _DetailPostUserViewState extends State<DetailPostUserView> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final postProvider = context.read<PostProvider>();
      await postProvider.getPosts(userID: widget.user.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: AppColors.green),
        centerTitle: true,
        title: Text('Posts de ${widget.user.name}',
          style: TextStyles.medium(
            size: 16,
            color: AppColors.green,
          ),
        ),
      ),
      body: Consumer<PostProvider>(
        builder: (context, postProvider, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  itemCount: postProvider.posts.length,
                  itemBuilder: (context, index) {
                    final post = postProvider.posts[index];
                    return PostUser(post: post);
                  },
                ),
              )
            ],
          );
        }
      ),
    );
  }
}