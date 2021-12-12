import 'video_hit.dart';

class VideoData {
  int total;
  int totalHits;
  List<VideoHit> hits;

  VideoData({required this.total, required this.totalHits, required this.hits});
  factory VideoData.fromJson(Map json) {
    return VideoData(
      total: json['total'],
      totalHits: json['totalHits'],
      hits: (json['hits'] as List).map((e) {
        final hit = VideoHit.fromJson(e);
        return hit;
      }).toList(),

      // List<dynamic>
    );
  }
}
