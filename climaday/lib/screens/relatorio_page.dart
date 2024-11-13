import 'package:climaday/services/api_clima.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RelatorioPage extends StatefulWidget {
  const RelatorioPage({super.key});

  @override
  State<RelatorioPage> createState() => _RelatorioPageState();
}

class _RelatorioPageState extends State<RelatorioPage> {
  Map? currencies;

  String formatDate(String date) {
    // Converte "13/11" para "November, 13"
    try {
      DateTime parsedDate = DateFormat('dd/MM').parse(date);
      return DateFormat('MMMM, dd').format(parsedDate);
    } catch (e) {
      print("Erro ao formatar data: $e");
      return date; // Retorna a data original em caso de erro
    }
  }

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
                          Expanded(
                            child: ListView.builder(
                                itemCount: 6,
                                itemBuilder: (ctx, index) {
                                  print(" semana: ${_dia[index]}");
                                  return SizedBox(
                                    height: 120,
                                    child: Card(
                                      color: const Color(0x40ffffff),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                _dia[index]['weekday'],
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                formatDate(_dia[index]["date"]),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                          Text(
                                            "${_dia[index]['temp']}°C",
                                            style: const TextStyle(
                                                fontSize: 24,
                                                color: Colors.white),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Chuva',
                                                style: TextStyle(
                                                  color: Color(0x80ffffff),
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Text(
                                                "${_dia[index]['rain']}mm",
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          )
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
