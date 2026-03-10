import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/advisor_provider.dart';
import 'screens/home_screen.dart';
import 'screens/advisors_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AdvisorProvider()..loadData(),
      child: MaterialApp(
        title: 'Konnect',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFF3B5BDB),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF3B5BDB),
          ),
          useMaterial3: true,
        ),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                builder: (_) => const HomeScreen(),
              );
            case '/advisors':
              final university = settings.arguments as String;
              return MaterialPageRoute(
                builder: (_) => AdvisorsScreen(university: university),
              );
            default:
              return MaterialPageRoute(
                builder: (_) => const HomeScreen(),
              );
          }
        },
      ),
    );
  }
}
