import 'dart:convert';

class Movie {
  final String title;
  final List<String> director;
  final double totalVote;
  final String poster;
  final List<String> star;
  final String lanuage;
  final String genre;
  final String date;
  Movie({
    required this.date,
    required this.title,
    required this.director,
    required this.totalVote,
    required this.poster,
    required this.star,
    required this.lanuage,
    required this.genre,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'director': director,
      'totalVote': totalVote,
      'poster': poster,
      'star': star,
      'lanuage': lanuage,
      'genre': genre,
      "releasedDate": date,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] ?? '',
      lanuage: map['language'] ?? '',
      poster: map['poster'] ?? '',
      director: List<String>.from(map['director']),
      star: List<String>.from(map['stars']),
      genre: map['genre'],
      totalVote: map['totalVoted']?.toDouble() ?? 0.0,
      date: map["releasedDate"].toString(),
    );
  }
  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));
}
