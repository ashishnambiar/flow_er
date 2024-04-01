import 'package:flow_er/Utils/Router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.pressed)) {
                  return 2;
                }
                if (states.contains(MaterialState.hovered)) {
                  return 5;
                }
                return 0;
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) {
                return Colors.deepPurple[50];
              },
            ),
          ),
        ),
      ),
      routerConfig: router,
    );
  }
}
