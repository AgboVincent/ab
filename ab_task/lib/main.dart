import 'package:ab_task/view/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     final textTheme = Theme.of(context).textTheme;
    return ScreenUtilInit(
      designSize: const Size(414, 640), // Base design size
      builder: (_, child) {
        return MaterialApp(
          initialRoute: '/pages',
          routes: customRoutes,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.karlaTextTheme(textTheme).copyWith(
            bodyMedium: GoogleFonts.karla(textStyle: textTheme.bodyMedium),
            bodyLarge: GoogleFonts.karla(textStyle: textTheme.bodyLarge),
            bodySmall: GoogleFonts.karla(textStyle: textTheme.bodySmall),
            ),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
              useMaterial3: true,
            ),
          home: child,
        );
      },
      child: const PagesScreen(),
    );
  }
}
