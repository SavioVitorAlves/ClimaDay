import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MeteorogicalWeather extends StatelessWidget {
  final Map? meteorological;

  const MeteorogicalWeather({required this.meteorological, super.key});

  @override
  Widget build(BuildContext context) {
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
    return Column(
      children: [
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
                    "${meteorological?["temp"].toString() ?? "00"}°",
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
                    meteorological?["wind_speedy"].toString() ?? "00",
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
                    "${meteorological?["humidity"].toString() ?? "00"}%",
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
                    "${meteorological?["rain"].toString() ?? "00"}mm",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
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
                    _fazesDaLua[meteorological?["moon_phase"].toString()] ??
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
                    "${meteorological?["cloudiness"].toString() ?? "00"}%",
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
      ],
    );
  }
}
