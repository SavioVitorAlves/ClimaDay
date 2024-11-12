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
      {'screen': const ClimaDayPage()},
      {'screen': const RelatorioPage()}
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
      body: _screens[_selectedScreensIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectdScreens,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.blue,
          currentIndex: _selectedScreensIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.insert_chart_sharp,
              ),
              label: 'Início',
            )
          ]),
    );
  }
}
