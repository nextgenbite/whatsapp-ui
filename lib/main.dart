import 'package:flutter/material.dart';
import 'package:whatsapp/screens/splash/splash_screen.dart';

// import 'widgets/ui_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF00A884),
          primary: Color(0xFF00A884),
          onPrimary: Color(0xFF00A884),
        ),
        useMaterial3: false,
      ),
      home: SplashScreen(),
    );
  }
}
