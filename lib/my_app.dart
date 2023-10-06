import 'package:calculadoraimc/pages/imc_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MaterialColor blackSwatch = const MaterialColor(
      0xff1f1f1f, // A cor preta tem o valor hexadecimal 0xFF000000
      <int, Color>{
        50: Color(0xff2b2b2b),
        100: Color(0xff1f1f1f),
        200: Color(0xff202020),
        300: Color(0xff161616),
        400: Color(0xff0f0f0f),
        500: Color(0xff131313),
        600: Color(0xff0f0f0f),
        700: Color(0xff131313),
        800: Color(0xff111111),
        900: Colors.black,
      },
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: blackSwatch,
          textTheme: GoogleFonts.poppinsTextTheme()),
      home: const ImcPage(),
    );
  }
}
