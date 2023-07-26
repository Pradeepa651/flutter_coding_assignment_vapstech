import 'package:flutter/material.dart';
import 'package:flutter_coding_assignment_vapstech/View/LogIn.dart';
import 'package:flutter_coding_assignment_vapstech/View/Movies.dart';
import 'package:flutter_coding_assignment_vapstech/View/signUpPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 640),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return FutureBuilder<SharedPreferences>(
              future: SharedPreferences.getInstance(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const ColoredBox(
                    color: Colors.white,
                    child: Center(
                      child:
                          CircularProgressIndicator(color: Colors.blueAccent),
                    ),
                  );
                } else if (snapshot.hasData) {
                  final snap = snapshot.data;
                  return MaterialApp(
                    title: 'Flutter Demo',
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      primarySwatch: Colors.blue,
                    ),
                    initialRoute: snap!.containsKey('User') ? '/Movies' : '/',
                    routes: {
                      '/': (context) => const SignUpPage(),
                      '/login': (context) => const LogIn(),
                      '/Movies': (context) => const MovieView(),
                    },
                  );
                } else {
                  return const Center(
                    child: Text('Error'),
                  );
                }
              });
        });
  }
}
