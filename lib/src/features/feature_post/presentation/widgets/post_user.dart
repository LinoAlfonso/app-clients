import 'package:ceiba_users/src/features/feature_post/domain/entities/post.dart';
import 'package:flutter/material.dart';

import '../../../../config/config.dart';

class PostUser extends StatelessWidget {
  final Post post;
  const PostUser({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title.toUpperCase(),
              style:  TextStyles.medium(
                size: 14,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              post.body,
              textAlign: TextAlign.justify,
              style: TextStyles.regular(
                size: 11,
                color: AppColors.primary,
              ),
            )
          ],
        ),
      ),
    );
  }
}