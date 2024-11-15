import 'package:flutter/material.dart';

class CitySearchPage extends StatefulWidget {
  const CitySearchPage({super.key});

  @override
  State<CitySearchPage> createState() => _CitySearchPageState();
}

class _CitySearchPageState extends State<CitySearchPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('relatorio da cidade pesquisada!'),
    );
  }
}
