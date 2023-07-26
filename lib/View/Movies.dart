import 'package:flutter/material.dart';
import 'package:flutter_coding_assignment_vapstech/commonWidgets/Button.dart';
import 'package:flutter_coding_assignment_vapstech/commonWidgets/MovieDetials.dart';
import 'package:flutter_coding_assignment_vapstech/commonWidgets/Voting.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_coding_assignment_vapstech/apiPostCall.dart';

import '../Model/MovieDataModel.dart';
import '../commonWidgets/rectangleImage.dart';

class MovieView extends StatefulWidget {
  const MovieView({Key? key}) : super(key: key);

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  late Future<List<Movie>> moviesData;

  @override
  initState() {
    moviesData = fetchMovies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Movies'),
          centerTitle: true,
          foregroundColor: Colors.white,
          actions: [
            PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'logout') {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (route) => false);
                  }
                },
                itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        value: 'Company',
                        child: Row(
                          children: [
                            Text(
                              'Company : ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 120.w,
                              child: Text(
                                'Geeksynergy Technologies Pvt Ltd',
                                maxLines: 3,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'Address',
                        child: Row(
                          children: [
                            Text(
                              'Address : ',
                              maxLines: 3,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 120.w,
                              child: Text(
                                'Sanjayanagar, Bengaluru-56',
                                maxLines: 3,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'Email',
                        child: Row(
                          children: [
                            Text(
                              'Email : ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'XXXXXX@gmail.com',
                              maxLines: 3,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'Email',
                        child: Row(
                          children: [
                            Text(
                              'Phone : ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'XXXXXXXXX09',
                              maxLines: 3,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'logout',
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 16.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ])
          ]),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: FutureBuilder<List<Movie>>(
              future: fetchMovies(),
              builder: (context, snap) {
                if (snap.hasData) {
                  final movies = snap.data!;
                  return ListView.builder(
                      itemCount: movies.length,
                      itemBuilder: (context, count) {
                        return Container(
                          height: 250.h,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: Color(0xFF928DBE),
                                ),
                                borderRadius: BorderRadius.circular(16).r),
                          ),
                          margin: const EdgeInsets.only(bottom: 25).r,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Voting(
                                      votingUp: movies[count].totalVote.toInt(),
                                    ),
                                    RectangleImage(
                                        src: movies[count].poster.toString()),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Expanded(
                                      child: MovieDetails(
                                          star: movies[count].star,
                                          genre: movies[count].genre.toString(),
                                          director: movies[count].director,
                                          language:
                                              movies[count].lanuage.toString(),
                                          totalVote: movies[count]
                                              .totalVote
                                              .toString(),
                                          title: movies[count].title.toString(),
                                          date: movies[count].date),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 15)
                                          .r,
                                  child: Button(
                                      text: 'Watch trailer', action: () {}),
                                )
                              ]),
                        );
                      });
                } else if (snap.hasError) {
                  return Center(
                      child: Column(
                    children: [
                      Text(snap.error.toString()),
                      ElevatedButton(
                          onPressed: _refresh, child: const Text('Refresh')),
                    ],
                  ));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }

  Future _refresh() async {
    setState(() {});
    return Future.delayed(const Duration(seconds: 1));
  }
}
