import 'dart:convert';
import 'package:book_wallert/ipaddress.dart';
import 'package:http/http.dart' as http;

class LikesApiService {
  static final String baseUrl = 'http://${ip}:3000/api/reviews';

  Future<List<Map<String, dynamic>>> fetchLikes(int reviewId) async {
    final response = await http.get(Uri.parse('$baseUrl/$reviewId/likes'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data
          .map((json) => {
                'user_id': json['user_id'],
                'username': json['username'],
              })
          .toList();
    } else {
      throw Exception('Failed to load likes');
    }
  }

  // Future<int> fetchLikeCount(int reviewId) async {
  //   final response = await http.get(Uri.parse('$baseUrl/$reviewId/like-count'));

  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body);
  //     return data['likeCount'];
  //   } else {
  //     throw Exception('Failed to load like count');
  //   }
  // }

  Future<void> likeReview(int reviewId, int userId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$reviewId/like'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'userId': userId}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to like review');
    }
  }

  Future<void> unlikeReview(int reviewId, int userId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$reviewId/unlike'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'userId': userId}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to unlike review');
    }
  }

  Future<bool> checkIfLiked(int reviewId, int userId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/$reviewId/likes/$userId'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['isLiked'];
    } else {
      throw Exception('Failed to check if liked');
    }
  }
}
