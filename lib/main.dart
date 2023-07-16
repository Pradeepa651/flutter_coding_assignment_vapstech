import 'package:flutter/material.dart';
import 'package:flutter_coding_assignment_vapstech/View/LogIn.dart';
import 'package:flutter_coding_assignment_vapstech/View/Movies.dart';
import 'package:flutter_coding_assignment_vapstech/View/signUpPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 640),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => const SignUpPage(),
              '/login': (context) => const LogIn(),
              '/Movies': (context) => const MovieView(),
            },
          );
        });
  }
}
