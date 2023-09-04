import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_calculator/view/calculatorscreen.dart';
bool isDark = false;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: isDark == true ? Brightness.dark : Brightness.light,
          useMaterial3: true,
          fontFamily: 'lato',
          textTheme: TextTheme(
            bodySmall: TextStyle(
              fontSize: 12,
            ),
            bodyMedium: TextStyle(
              fontSize: 14,
            ),
            bodyLarge: TextStyle(
              fontSize: 18,
            ),
          )
      ),
      home:  CalculatorView(),
    );
  }
}