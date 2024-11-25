import 'dart:convert';
import 'package:climaday/utils/api_route.dart';

import 'package:http/http.dart' as http;

String substituirUnderlinePorEspaco(String entrada) {
  return entrada.replaceAll('_', ' ');
}

String normalizarCidade(String cidade) {
  return cidade.replaceAll(RegExp(r'\s+'), ' ').trim();
}

class ApiClima {
  Future<Map> loadWeather() async {
    ApiRoute apiRoute = ApiRoute();
    String url = await apiRoute.getWeatherUrlWithLocation();
    print(url);
    try {
      print("Tentando conectar...");
      final response = await http.get(Uri.parse(url));
      print("Status code: ${response.statusCode}");
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception("Erro ao carregar dados: ${response.statusCode}");
      }
    } catch (e) {
      print("Erro de rede: $e");
      throw Exception("Erro de rede: $e");
    }
  }

  Future<String> imgWeather(String img) async {
    try {
      return "${ApiRoute.TEMP_IMG}$img.svg";
    } catch (e) {
      throw Future.error('Erro ao obter a imagem: $e');
    }
  }

  Future<Map> cityWeather(String city) async {
    try {
      print("Tentando conectar...");
      print("City: $city");
      final response = await http.get(Uri.parse("${ApiRoute.TEMP_CITY}$city"));

      print("Status code: ${response.statusCode}");
      print("Response: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Verifique se a cidade retornada é a padrão
        final results = data['results'];
        print(substituirUnderlinePorEspaco(city));
        // Se a cidade retornada não for igual à pesquisada e for uma das cidades padrão, rejeite o resultado
        if (substituirUnderlinePorEspaco(city) != "São Paulo,SP" &&
            (results["city"] == "São Paulo, SP" ||
                results["city"] == "Miami, Florida")) {
          throw Exception("Cidade inválida: retornou dados da cidade padrão");
        }

        return data;
      } else {
        // Status HTTP fora da faixa 200
        throw Exception("Erro ao carregar dados: ${response.statusCode}");
      }
    } catch (e) {
      print("Erro de rede: $e");
      throw Exception("Erro de rede: $e");
    }
  }
}
