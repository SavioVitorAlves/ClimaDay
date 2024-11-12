import 'dart:convert';
import 'package:climaday/utils/api_route.dart';
import 'package:http/http.dart' as http;

class ApiClima {
  Future<Map> loadWeather() async {
    try {
      print("Tentando conectar...");
      final response = await http.get(Uri.parse(ApiRoute.TEMP_DAY));
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
}
