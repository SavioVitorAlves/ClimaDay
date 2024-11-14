import 'package:climaday/services/api_clima.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImgTemp extends StatelessWidget {
  ImgTemp({required this.altura, required this.img, super.key});
  String img;
  double altura;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiClima().imgWeather(img),
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
                return SvgPicture.network(
                  snapshot.data!,
                  height: altura,
                );
              }
          }
        });
  }
}
