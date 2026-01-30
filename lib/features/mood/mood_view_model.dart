import 'dart:math' as math;

import 'package:testapp/core/base/base_view_model.dart';
import 'package:testapp/core/constants/app_assets.dart';



class MoodViewModel extends BaseViewModel {
  MoodViewModel() : _angleRadians = 0.8;

  static final List<MoodSegment> _moodSegments = [
    MoodSegment('Happy', AppAssets.moodFace1, 0),
    MoodSegment('Calm', AppAssets.moodFace2, math.pi / 3),
    MoodSegment('Content', AppAssets.moodFace3, 2 * math.pi / 3),
    MoodSegment('Peaceful', AppAssets.moodFace4, math.pi),
    MoodSegment('Thoughtful', AppAssets.moodFace1, 4 * math.pi / 3),
    MoodSegment('Relaxed', AppAssets.moodFace2, 5 * math.pi / 3),
  ];

  double _angleRadians;

  double get angleRadians => _angleRadians;

  String get currentMoodLabel => _moodForAngle(_angleRadians).label;

  String get currentMoodImagePath => _moodForAngle(_angleRadians).imagePath;

  static MoodSegment _moodForAngle(double angle) {
    var normalized = angle % (2 * math.pi);
    if (normalized < 0) normalized += 2 * math.pi;
    MoodSegment best = _moodSegments.first;
    double bestDist = double.infinity;
    for (final segment in _moodSegments) {
      final dist = (normalized - segment.startAngle).abs();
      final distWrap = math.min(dist, 2 * math.pi - dist);
      if (distWrap < bestDist) {
        bestDist = distWrap;
        best = segment;
      }
    }
    return best;
  }

  void setAngleRadians(double angle) {
    _angleRadians = angle;
    notify();
  }
}

class MoodSegment {
  MoodSegment(this.label, this.imagePath, this.startAngle);

  final String label;
  final String imagePath;
  final double startAngle;
}
