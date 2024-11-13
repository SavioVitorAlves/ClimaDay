import 'package:geolocator/geolocator.dart';

class ApiRoute {
  static const String _apiKey = "6417ae14";

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
      print(latitude);

      // Cria a URL com a latitude e longitude obtidas
      return "https://api.hgbrasil.com/weather?key=$_apiKey&lat=$latitude&lon=$longitude&user_ip=remote";
    } catch (e) {
      return Future.error('Erro ao obter localização: $e');
    }
  }

  static const TEMP_DAY = "https://api.hgbrasil.com/weather?key=6417ae14";
  //static const TEMP_DAY_LOCAL = "https://api.hgbrasil.com/weather?key=6417ae14&lat=-23.682&lon=-46.875&user_ip=remote";
}
