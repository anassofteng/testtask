import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/nav_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/bottom_nav_item.dart';
import '../mood/mood_screen.dart';
import '../nutrition/nutrition_screen.dart';
import '../plan/plan_screen.dart';
import '../profile/profile_screen.dart';
import 'navbar_view_model.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  late final NavBarViewModel _viewModel;

  static final List<Widget> _screens = const [
    NutritionScreen(),
    PlanScreen(),
    MoodScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _viewModel = NavBarViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: ListenableBuilder(
        listenable: _viewModel,
        builder: (context, _) {
          return IndexedStack(
            index: _viewModel.currentIndex,
            children: _screens,
          );
        },
      ),
      bottomNavigationBar: ListenableBuilder(
        listenable: _viewModel,
        builder: (context, _) {
          return Container(
            decoration: const BoxDecoration(
              color: AppColors.navBackground,
              border: Border(
                top: BorderSide(color: AppColors.navTopLine, width: 1),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomNavItem(
                      imageAssetPath: AppAssets.navNutrition,
                      label: 'Nutrition',
                      isActive: _viewModel.currentIndex == NavRoutes.nutrition,
                      onTap: () => _viewModel.setIndex(NavRoutes.nutrition),
                    ),
                    BottomNavItem(
                      imageAssetPath: AppAssets.navPlan,
                      label: 'Plan',
                      isActive: _viewModel.currentIndex == NavRoutes.plan,
                      onTap: () => _viewModel.setIndex(NavRoutes.plan),
                    ),
                    BottomNavItem(
                      imageAssetPath: AppAssets.navMood,
                      label: 'Mood',
                      isActive: _viewModel.currentIndex == NavRoutes.mood,
                      onTap: () => _viewModel.setIndex(NavRoutes.mood),
                    ),
                    BottomNavItem(
                      imageAssetPath: AppAssets.navProfile,
                      label: 'Profile',
                      isActive: _viewModel.currentIndex == NavRoutes.profile,
                      onTap: () => _viewModel.setIndex(NavRoutes.profile),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
