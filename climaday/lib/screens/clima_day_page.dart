import 'package:climaday/services/api_clima.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClimaDayPage extends StatefulWidget {
  const ClimaDayPage({super.key});

  @override
  State<ClimaDayPage> createState() => _ClimaDayPageState();
}

class _ClimaDayPageState extends State<ClimaDayPage> {
  Map? currencies;
  final Map<String, String> _fazesDaLua = {
    "new": "Lua nova",
    "waxing_crescent": "Lua crescente",
    "first_quarter": "Quarto crescente",
    "waxing_gibbous": "Gibosa crescente",
    "full": "Lua cheia",
    "waning_gibbous": "Gibosa minguante",
    "last_quarter": "Quarto minguante",
    "waning_crescent": "Lua minguante",
  };
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
                    style: const TextStyle(color: Colors.white),
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
                          height: 35,
                        ),
                        const Icon(
                          Icons.cloud,
                          color: Colors.blue,
                          size: 320,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          currencies?["description"],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.thermostat,
                                    size: 21,
                                    color: Colors.blue,
                                  ),
                                  const Text(
                                    'Temp',
                                    style: TextStyle(
                                      color: Color(0x80ffffff),
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    "${currencies?["temp"].toString() ?? "00"}°",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.wind,
                                    size: 21,
                                    color: Colors.blue,
                                  ),
                                  const Text(
                                    'Vento',
                                    style: TextStyle(
                                      color: Color(0x80ffffff),
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    currencies?["wind_speedy"].toString() ??
                                        "00",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.water_drop_outlined,
                                    size: 21,
                                    color: Colors.blue,
                                  ),
                                  const Text(
                                    'Humidade',
                                    style: TextStyle(
                                      color: Color(0x80ffffff),
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    "${currencies?["humidity"].toString() ?? "00"}%",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.cloudRain,
                                    size: 21,
                                    color: Colors.blue,
                                  ),
                                  const Text(
                                    'Chuva',
                                    style: TextStyle(
                                      color: Color(0x80ffffff),
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    "${currencies?["rain"].toString() ?? "00"}mm",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.moon,
                                    size: 21,
                                    color: Colors.blue,
                                  ),
                                  const Text(
                                    'Fase da Lua',
                                    style: TextStyle(
                                      color: Color(0x80ffffff),
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    _fazesDaLua[currencies?["moon_phase"]
                                            .toString()] ??
                                        "erro",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.cloudMeatball,
                                    size: 21,
                                    color: Colors.blue,
                                  ),
                                  const Text(
                                    'nebulosidade',
                                    style: TextStyle(
                                      color: Color(0x80ffffff),
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    "${currencies?["cloudiness"].toString() ?? "00"}%",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
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
