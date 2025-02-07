import 'package:flutter/material.dart';

import '../../../../config/config.dart';
import '../../domain/domain.dart';

class UserInfoCard extends StatelessWidget {
  final Function(User) onTap;
  final User user;

  const UserInfoCard({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: TextStyles.bold(
                size: 18,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.phone, color: AppColors.green),
                const SizedBox(width: 8),
                Text(user.phone, style: const TextStyle(color: AppColors.primary)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.email, color: AppColors.green),
                const SizedBox(width: 8),
                Text(user.email, style: const TextStyle(color: AppColors.primary)),
              ],
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => onTap(user),
                child: const Text(
                  "VER PUBLICACIONES",
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}