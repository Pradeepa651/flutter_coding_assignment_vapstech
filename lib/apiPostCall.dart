import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Model/MovieDataModel.dart';

Future<List<Movie>> fetchMovies() async {
  var url = Uri.https('hoblist.com', 'api/movieList');
  final response = await http.post(url, body: {
    "category": "movies",
    "language": "kannada",
    "genre": "all",
    "sort": "voting",
  });

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (responseData.containsKey('result')) {
      final List<dynamic> moviesData = responseData['result'];
      return moviesData.map((json) => Movie.fromMap(json)).toList();
    } else {
      throw Exception('Invalid movie data received');
    }
  } else {
    throw Exception(
        'Failed to fetch movies. Status code: ${response.statusCode}');
  }
}
