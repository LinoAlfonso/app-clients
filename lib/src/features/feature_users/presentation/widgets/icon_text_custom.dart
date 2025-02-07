import 'package:flutter/material.dart';

import '../../../../config/config.dart';

class IconTextCustom extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconTextCustom({super.key, required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 50,
          color: AppColors.primary,
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: TextStyles.regular(
           size: 16,
            color: AppColors.primary
          ),
        ),
      ],
    );
  }

}