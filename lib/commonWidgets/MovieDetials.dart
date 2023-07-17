import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetails extends StatelessWidget {
  final List<String> star;
  final String genre;
  final List<String> director;
  final String language;
  final String totalVote;
  final String title;
  final String date;

  const MovieDetails({
    Key? key,
    required this.star,
    required this.genre,
    required this.director,
    required this.language,
    required this.totalVote,
    required this.title,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Title : $title',
          maxLines: 2,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        for (String dir in director)
          Text(
            'Director : $dir',
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        for (String str in star)
          Text(
            'Star : $str',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        Text(
          '$language | ${DateTime.parse(date).day}',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'totalVote : $totalVote',
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 15.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
