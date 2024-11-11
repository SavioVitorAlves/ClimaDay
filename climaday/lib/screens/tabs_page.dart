import 'package:climaday/screens/clima_day_page.dart';
import 'package:climaday/screens/relatorio_page.dart';
import 'package:flutter/material.dart';

class TabsScreens extends StatefulWidget {
  const TabsScreens({super.key});

  @override
  State<TabsScreens> createState() => _TabsScreensState();
}

class _TabsScreensState extends State<TabsScreens> {
  int _selectedScreensIndex = 0;
  late List<Map<String, Object>> _screens;
  @override
  void initState() {
    super.initState();
    _screens = [
      {'title': '', 'screen': const ClimaDayPage()},
      {'title': 'Relatorio de Previsao', 'screen': const RelatorioPage()}
    ];
  }

  _selectdScreens(int index) {
    setState(() {
      _selectedScreensIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(_screens[_selectedScreensIndex]['title'] as String),
      ),
      body: _screens[_selectedScreensIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectdScreens,
          backgroundColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedScreensIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.insert_chart_sharp,
              ),
            )
          ]),
    );
  }
}
