import 'package:climaday/components/img_temp.dart';
import 'package:climaday/components/meteorogical_weather.dart';
import 'package:flutter/material.dart';
import 'package:climaday/components/card_temp_week.dart';
import 'package:intl/intl.dart';

class CitySearchPage extends StatelessWidget {
  const CitySearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map meteorological = ModalRoute.of(context)!.settings.arguments as Map;
    List<dynamic> _dia = meteorological["forecast"] ?? [];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meteorological["city"] ?? "Cidade Desconhecida",
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
            color: Colors.blue), // Altera a cor do ícone de voltar,
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center,
              colors: [Color.fromARGB(255, 59, 59, 59), Color(0xFF000000)],
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              const SizedBox(
                height: 5,
              ),
              Text(
                DateFormat("dd, MMMM 'de' yyyy").format(DateTime.now()),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              ImgTemp(
                img: meteorological["condition_slug"] ?? "clear_day",
                altura: 380,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                meteorological["description"] ?? 'Descrição Indisponivel',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              MeteorogicalWeather(meteorological: meteorological),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Proximas Previsoes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CardTempWeek(dia: _dia)
            ],
          )),
    );
  }
}
