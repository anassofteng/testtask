/// Asset paths used across the app. Single place to update if paths change.
abstract class AppAssets {
  AppAssets._();

  static const String _images = 'assets/images';

  static const String navNutrition = '$_images/nutrition.png';
  static const String navPlan = '$_images/calendar.png';
  static const String navMood = '$_images/mood.png';
  static const String navProfile = '$_images/person.png';

  // Mood screen - center face images (per mood)
  static const String moodFace1 = '$_images/_Group_.png';
  static const String moodFace2 = '$_images/_Group_ (1).png';
  static const String moodFace3 = '$_images/_Group_ (2).png';
  static const String moodFace4 = '$_images/_Group_ (3).png';
}
