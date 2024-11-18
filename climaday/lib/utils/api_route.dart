import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';

class ApiRoute {
  final String _apiKey = dotenv.env['API_KEY'] ?? 'URL não definida';

  // Função para obter a localização
  Future<Position> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verifica se os serviços de localização estão habilitados
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Serviço de localização está desabilitado.');
    }

    // Verifica se as permissões estão garantidas
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Permissão de localização negada.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Permissões de localização foram permanentemente negadas.');
    }

    // Retorna a localização atual
    return await Geolocator.getCurrentPosition();
  }

  // Método para gerar a URL de clima com coordenadas dinâmicas
  Future<String> getWeatherUrlWithLocation() async {
    try {
      Position position = await _getLocation();
      double latitude = position.latitude;
      double longitude = position.longitude;

      // Cria a URL com a latitude e longitude obtidas
      return "https://api.hgbrasil.com/weather?key=$_apiKey&lat=$latitude&lon=$longitude&user_ip=remote";
    } catch (e) {
      return Future.error('Erro ao obter localização: $e');
    }
  }

  static late final TEMP_DAY =
      "https://api.hgbrasil.com/weather?key=${dotenv.env['API_KEY']}";
  static const TEMP_IMG =
      "https://assets.hgbrasil.com/weather/icons/conditions/";
  static late final TEMP_CITY =
      "https://api.hgbrasil.com/weather?key=${dotenv.env['API_KEY']}&city_name=";
  //static const TEMP_DAY_LOCAL = "https://api.hgbrasil.com/weather?key=6417ae14&lat=-23.682&lon=-46.875&user_ip=remote";
}
