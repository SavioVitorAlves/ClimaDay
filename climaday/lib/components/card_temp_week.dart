import 'package:climaday/components/img_temp.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CardTempWeek extends StatelessWidget {
  final List<dynamic> dia;
  const CardTempWeek({required this.dia, super.key});

  @override
  Widget build(BuildContext context) {
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

    return Expanded(
      child: ListView.builder(
          itemCount: 7,
          itemBuilder: (ctx, index) {
            print(" semana: ${dia[index]}");
            return SizedBox(
              height: 120,
              child: Card(
                color: const Color(0x40ffffff),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.date_range_rounded,
                          size: 21,
                          color: Colors.blue,
                        ),
                        Text(
                          dia[index]['weekday'],
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          formatDate(dia[index]["date"]),
                          style: const TextStyle(
                              color: Color(0x80ffffff), fontSize: 12),
                        )
                      ],
                    ),
                    ImgTemp(
                      img: dia[index]["condition"],
                      altura: 120,
                    ),
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
                          "${dia[index]['rain']}mm",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
