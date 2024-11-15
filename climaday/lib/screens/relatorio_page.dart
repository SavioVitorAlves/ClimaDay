import 'package:climaday/components/card_temp_week.dart';
import 'package:climaday/services/api_clima.dart';
import 'package:flutter/material.dart';

class RelatorioPage extends StatefulWidget {
  const RelatorioPage({super.key});

  @override
  State<RelatorioPage> createState() => _RelatorioPageState();
}

class _RelatorioPageState extends State<RelatorioPage> {
  Map? currencies;

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
                currencies = snapshot.data!["results"];
                print(snapshot.data);
                List<dynamic> _dia = currencies?["forecast"];
                return Scaffold(
                  appBar: AppBar(
                    title: const Text(
                      'Relatorio de Previsão',
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
                          const Row(
                            children: [
                              Text(
                                'Hoje',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              Spacer(),
                              Text(
                                '11, November de 2024',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Proximas Previsoes',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CardTempWeek(dia: _dia),
                        ],
                      ),
                    ),
                  ),
                );
              }
          }
        });
  }
}
