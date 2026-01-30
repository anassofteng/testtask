import 'package:flutter/material.dart';
import 'package:testapp/core/theme/app_colors.dart';



class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.imageAssetPath,
    required this.label,
    required this.isActive,
    required this.onTap,
    this.iconSize = 26,
  });

  final String imageAssetPath;
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final color = isActive
        ? AppColors.navItemActive
        : AppColors.navItemInactive;

    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageAssetPath,
            width: iconSize,
            height: iconSize,
            color: color,
            colorBlendMode: BlendMode.srcIn,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
