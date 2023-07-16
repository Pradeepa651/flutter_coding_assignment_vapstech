import 'dart:core';

import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  final List<String> Star;
  final String Genre;
  final List<String> Director;
  final String language;
  final String totalVote;
  final String title;
  final String date;

  const MovieDetails({
    Key? key,
    required this.Star,
    required this.Genre,
    required this.Director,
    required this.language,
    required this.totalVote,
    required this.title,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
// Format the date as desired

    return SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Title : $title',
            maxLines: 2,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          for (String str in Star)
            Text(
              'Director: $str',
              maxLines: 3,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          for (String str in Director)
            Text(
              'Director: $str',
              maxLines: 3,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          Text(
            '$language \| ${DateTime.parse(date).day}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'totalVote : $totalVote',
            style: const TextStyle(
              color: Colors.blueAccent,
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
