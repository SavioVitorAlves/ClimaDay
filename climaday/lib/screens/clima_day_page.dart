import 'package:climaday/components/img_temp.dart';
import 'package:climaday/components/meteorogical_weather.dart';
import 'package:climaday/services/api_clima.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClimaDayPage extends StatefulWidget {
  const ClimaDayPage({super.key});

  @override
  State<ClimaDayPage> createState() => _ClimaDayPageState();
}

class _ClimaDayPageState extends State<ClimaDayPage> {
  Map? meteorological;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: ApiClima().loadWeather(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      Color.fromARGB(255, 59, 59, 59),
                      Color(0xFF000000)
                    ],
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Carregando dados....",
                    style: TextStyle(color: Colors.blue, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                ));
          case ConnectionState.active:
            return const Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasError) {
              print(snapshot.data);
              return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        Color.fromARGB(255, 59, 59, 59),
                        Color(0xFF000000)
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Erro Ao carregar os dados",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ));
            } else {
              // Dados carregados com sucesso, exiba os dados aqui
              //return Text(snapshot.data!['resultado'].toString());
              meteorological = snapshot.data!["results"];
              print(snapshot.data);
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    meteorological?["city"] ?? "Cidade Desconhecida",
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
                          height: 5,
                        ),
                        Text(
                          DateFormat("dd, MMMM 'de' yyyy")
                              .format(DateTime.now()),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ImgTemp(
                          img: meteorological?["condition_slug"],
                          altura: 380,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          meteorological?["description"],
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
