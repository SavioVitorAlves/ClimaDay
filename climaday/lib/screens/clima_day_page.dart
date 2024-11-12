import 'package:climaday/components/card_temp_hora.dart';
import 'package:climaday/services/api_clima.dart';
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
  Map? currencies;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: ApiClima().loadWeather(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const Center(
              child: Text(
                "Carregando dados....",
                style: TextStyle(color: Colors.amber, fontSize: 25),
                textAlign: TextAlign.center,
              ),
            );
          case ConnectionState.active:
            return const Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasError) {
              print(snapshot.data);
              return const Center(
                child: Text(
                  "Erro Ao carregar os dados",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              // Dados carregados com sucesso, exiba os dados aqui
              //return Text(snapshot.data!['resultado'].toString());
              currencies = snapshot.data!["results"];
              print(snapshot.data);
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    currencies?["city"] ?? "Cidade Desconhecida",
                    style: TextStyle(color: Colors.white),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.black,
                ),
                body: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        Color.fromARGB(255, 59, 59, 59),
                        Color(0xFF000000)
                      ],
                    ),
                  ),
                  child: Center(
                    child: Column(
                      children: [
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
                          size: 390,
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
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
      },
    );
  }
}
/*

      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Nome da cidade',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [Color.fromARGB(255, 59, 59, 59), Color(0xFF000000)],
            ),
          ),
          child: Center(
            child: Column(
              children: [
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
                  size: 390,
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
                            style: TextStyle(color: Colors.white, fontSize: 16),
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
                            style: TextStyle(color: Colors.white, fontSize: 16),
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
                            style: TextStyle(color: Colors.white, fontSize: 16),
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
      ),
*/