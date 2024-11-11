import 'package:flutter/material.dart';

class CardTempHora extends StatefulWidget {
  const CardTempHora({required this.forecastList, super.key});
  final List<Map<String, String>> forecastList;

  @override
  State<CardTempHora> createState() => _CardTempHoraState();
}

class _CardTempHoraState extends State<CardTempHora> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      //_scrollToCurrentHour();
    });
  }

  /*void _scrollToCurrentHour() {
    // Aqui você encontra o índice do horário atual na `forecastList`
    int index = widget.forecastList.indexWhere((forecast) {
      // Considera a hora atual
      DateTime now = DateTime.now();
      return forecast.time.hour == now.hour;
    });

    if (index != -1) {
      // Scroll para o item do horário atual com animação
      _scrollController.animateTo(
        index * 80.0, // Ajuste o valor `80.0` para o tamanho exato do item
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }*/

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.forecastList.length, // Lista com dados do carrossel
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    widget.forecastList[index]["icon"]!,
                    style: const TextStyle(fontSize: 40),
                  ), // Ícone do clima
                  Column(
                    children: [
                      Text(widget.forecastList[index]["temp"]!), // Temperatura
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.forecastList[index]["time"]!,
                        style: const TextStyle(fontSize: 13),
                      ), // Hora
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
