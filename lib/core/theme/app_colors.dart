import 'package:flutter/material.dart';

/// Centralized app colors for consistency and scalability.
/// Use these instead of hardcoded colors throughout the app.
abstract class AppColors {
  AppColors._();

  // Background
  static const Color backgroundDark = Color(0xFF000000);

  // Bottom nav
  static const Color navBackground = Color(0xFF000000);
  static const Color navTopLine = Color(0xFF2E2E32);
  static const Color navItemActive = Colors.white;
  static const Color navItemInactive = Color.fromARGB(
    255,
    130,
    129,
    130,
  ); // muted light purple/grey

  // Plan screen
  static const Color cardBackground = Color(0xFF2A2A2E);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFF9E9E9E);
  static const Color accentGreen = Color(0xFF4CAF50);
  static const Color accentTeal = Color(0xFF2D9D9D);
  static const Color progressTrack = Color(0xFF3D3D42);
  static const Color hydrationBlue = Color(0xFF8BE9FD);
  static const Color hydrationScaleLine = Color(0xFF9E9E9E);
  static const Color hydrationCardBanner = Color(0xFF2C4E5E);
  static const Color hydrationCardBg = Color(0xFF1A1A1A);

  // Plan (Training Calendar) screen
  static const Color planWeekSeparator = Color(0xFF2D9D9D);
  static const Color planDayStrip = Color(0xFFB0B0B5);
  static const Color planPillPurple = Color(0xFF9C27B0);
  static const Color planPillGreenBg = Color(0xFF2E7D32);
  static const Color planRowSeparator = Color(0xFF3D3D42);
  static const Color planCardStrip = Color(0xFFE8E8E8);

  // Mood screen - circular slider gradient
  static const Color moodGradientOrange = Color(0xFFFF9A7B);
  static const Color moodGradientPink = Color(0xFFFF6B9D);
  static const Color moodGradientPurple = Color(0xFFB388EB);
  static const Color moodGradientTeal = Color(0xFF80DEEA);
  static const Color moodThumb = Color(0xFFFAFAFA);
  static const Color moodContinueBg = Colors.white;
  static const Color moodContinueText = Color(0xFF1A1A1A);
  static const Color moodScreenGradientTop = Color(0xFF2E2E40);
}
