import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practica1/provider/theme_provider.dart';
import 'package:practica1/screens/about_us_screen.dart';
import 'package:practica1/screens/dashboard_screen.dart';
import 'package:practica1/screens/list_popular_screen.dart';
import 'package:practica1/screens/list_task_screen.dart';
import 'package:practica1/screens/login_screen.dart';
import 'package:practica1/screens/popular_detail_screen.dart';
import 'package:practica1/screens/sign_up_screen.dart';
import 'package:practica1/screens/splash_screen.dart';
import 'package:practica1/screens/task_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemeProvider(), child: PMSNApp());
  }
}

class PMSNApp extends StatelessWidget {
  const PMSNApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider tema = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: tema.getthemeData(),
      home: const SplashScreen(),
      routes: {
        '/dash': (BuildContext context) => DashboardScreen(),
        '/login': (BuildContext context) => LoginScreen(),
        '/task': (BuildContext context) => ListTaskScreen(),
        '/add': (BuildContext context) => TaskScreen(),
        '/list': (BuildContext context) => ListPopularScreen(),
        '/detail': (BuildContext context) => PopularDetailScreen(),
        '/about': (BuildContext context) => AboutUsScreen(),
        '/signup': (BuildContext context) => SignUpScreen()
      },
    );
  }
}
