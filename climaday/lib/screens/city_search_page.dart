import 'package:climaday/components/img_temp.dart';
import 'package:climaday/components/meteorogical_weather.dart';
import 'package:flutter/material.dart';

class CitySearchPage extends StatelessWidget {
  const CitySearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map meteorological = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meteorological["city"] ?? "Cidade Desconhecida",
          style: const TextStyle(color: Colors.white),
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
              child: Column(children: [
            const SizedBox(
              height: 5,
            ),
            const Text(
              '11, November de 2024',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            const SizedBox(
              height: 15,
            ),
            ImgTemp(
              img: meteorological["condition_slug"],
              altura: 380,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              meteorological["description"],
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            MeteorogicalWeather(meteorological: meteorological),
            const SizedBox(
              height: 20,
            )
          ]))),
    );
  }
}
