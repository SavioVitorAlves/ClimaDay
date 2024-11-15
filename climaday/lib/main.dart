import 'package:climaday/screens/city_search_page.dart';
import 'package:climaday/screens/clima_day_page.dart';
import 'package:climaday/screens/relatorio_page.dart';
import 'package:climaday/screens/tabs_page.dart';
import 'package:climaday/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const TabsScreens(),
      routes: {
        AppRoutes.HOME: (ctx) => const TabsScreens(),
        AppRoutes.RELATORIO_PAGE: (ctx) => const RelatorioPage(),
        AppRoutes.CITY_SEARCH: (ctx) => const CitySearchPage(),
      },
    );
  }
}
