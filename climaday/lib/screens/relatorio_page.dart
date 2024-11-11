import 'package:climaday/components/card_temp_hora.dart';
import 'package:flutter/material.dart';

class RelatorioPage extends StatefulWidget {
  const RelatorioPage({super.key});

  @override
  State<RelatorioPage> createState() => _RelatorioPageState();
}

class _RelatorioPageState extends State<RelatorioPage> {
  final List<Map<String, String>> forecastList = [
    {"icon": "🌞", "temp": "32°C", "time": "14:00"},
    {"icon": "🌧️", "temp": "30°C", "time": "15:00"},
    {"icon": "⛈️", "temp": "28°C", "time": "16:00"},
    {"icon": "🌤️", "temp": "29°C", "time": "17:00"},
    {"icon": "🌙", "temp": "26°C", "time": "18:00"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    'Hoje',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    '11, November de 2024',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CardTempHora(forecastList: forecastList),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Proximas Previsoes',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
