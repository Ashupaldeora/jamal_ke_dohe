import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jamal_ke_dohe/screens/details_screen/view/details.dart';
import 'package:jamal_ke_dohe/screens/home/provider/home_provider.dart';
import 'package:jamal_ke_dohe/screens/home/view/home.dart';
import 'package:jamal_ke_dohe/theme/dark_theme.dart';
import 'package:jamal_ke_dohe/theme/light_theme.dart';
import 'package:jamal_ke_dohe/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
