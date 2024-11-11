import 'package:climaday/components/card_temp_hora.dart';
import 'package:flutter/material.dart';

class ClimaDayPage extends StatefulWidget {
  const ClimaDayPage({super.key});

  @override
  State<ClimaDayPage> createState() => _ClimaDayPageState();
}

class _ClimaDayPageState extends State<ClimaDayPage> {
  // Lista de dados fictícios para teste
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
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Color(0xFF171717), Color(0xFF000000)],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Nome da Cidade',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '11, November de 2024',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              const SizedBox(
                height: 20,
              ),
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Temp',
                          style: TextStyle(
                            color: Color(0x80ffffff),
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          '32°',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Vento',
                          style: TextStyle(
                            color: Color(0x80ffffff),
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          '10km/h',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Humidade',
                          style: TextStyle(
                            color: Color(0x80ffffff),
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          '75%',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Hoje',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Ver relatorio total'))
                  ],
                ),
              ),
              CardTempHora(forecastList: forecastList),
            ],
          ),
        ),
      ),
    );
  }
}
