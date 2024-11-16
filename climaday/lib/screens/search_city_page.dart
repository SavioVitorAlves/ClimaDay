import 'package:climaday/services/api_clima.dart';
import 'package:climaday/utils/app_routes.dart';
import 'package:flutter/material.dart';

class SearchCityPage extends StatefulWidget {
  const SearchCityPage({super.key});

  @override
  State<SearchCityPage> createState() => _SearchCityPageState();
}

class _SearchCityPageState extends State<SearchCityPage> {
  String? selectedItem;
  final _cityController = TextEditingController();
  Map? meteorological;
  final List<String> _estados = [
    "AC", // Acre
    "AL", // Alagoas
    "AP", // Amapá
    "AM", // Amazonas
    "BA", // Bahia
    "CE", // Ceará
    "DF", // Distrito Federal
    "ES", // Espírito Santo
    "GO", // Goiás
    "MA", // Maranhão
    "MT", // Mato Grosso
    "MS", // Mato Grosso do Sul
    "MG", // Minas Gerais
    "PA", // Pará
    "PB", // Paraíba
    "PR", // Paraná
    "PE", // Pernambuco
    "PI", // Piauí
    "RJ", // Rio de Janeiro
    "RN", // Rio Grande do Norte
    "RS", // Rio Grande do Sul
    "RO", // Rondônia
    "RR", // Roraima
    "SC", // Santa Catarina
    "SP", // São Paulo
    "SE", // Sergipe
    "TO" // Tocantins
  ];

  String? cityPlusCoutry;
  bool verifyController = false;
  String? textController = "";
  String? textUf = "";

  void cityCoutry() {
    setState(() {
      // Reinicia as mensagens de erro antes da validação
      textController = "";
      textUf = "";
      verifyController = false;
    });
    if (_cityController.text.trim().isEmpty &&
        (selectedItem == null || selectedItem!.isEmpty)) {
      setState(() {
        verifyController = true;
        textController = "*O campo de nome da cidade nao esta preenchido.*";
        textUf = "*O estado nao foi selecionado.*";
      });
    } else if (_cityController.text.trim().isEmpty) {
      setState(() {
        verifyController = true;
        textController = "*O campo de nome da cidade nao esta preenchido.*";
      });
    } else if (selectedItem == null || selectedItem!.isEmpty) {
      setState(() {
        verifyController = true;
        textUf = "*O estado nao foi selecionado.*";
      });
    } else {
      verifyController = false;
      String city = capitalizeEachWord(_cityController.text);
      setState(() {
        cityPlusCoutry = "$city,$selectedItem";
      });
    }
  }

  String capitalizeEachWord(String input) {
    if (input.isEmpty) return input;

    return input
        .split(" ") // Divide a string em uma lista de palavras
        .map((word) => word.isNotEmpty
            ? word[0].toUpperCase() + word.substring(1).toLowerCase()
            : "") // Converte a primeira letra em maiúscula e o resto em minúscula
        .join("_"); // Junta as palavras com _ como delimitador
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Encontre a Localização',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Color.fromARGB(255, 59, 59, 59), Color(0xFF000000)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'encontre a área da cidade onde você deseja saber as informações meteorológicas detalhadas neste momento',
              style: TextStyle(color: Colors.white, fontSize: 11),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(children: [
              Expanded(
                //flex: 2, // Define a proporção de largura
                child: TextField(
                    cursorColor: Colors.blue,
                    controller: _cityController,
                    style: const TextStyle(
                      color: Colors.white, // Cor do texto digitado
                    ),
                    decoration: InputDecoration(
                      labelText: 'Cidade',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: const Color(0x40ffffff), // Cor de fundo
                      hintText: "Digite algo", // Texto de dica
                      hintStyle: const TextStyle(
                          color: Colors.white), // Estilo do texto de dica
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal:
                              16.0), // Definir altura e espaçamento interno
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            12.0), // Arredondamento dos cantos
                        borderSide: BorderSide.none, // Remover a borda padrão
                      ),
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 65, // Largura fixa (igual à altura para ser quadrado)
                height: 65, // Altura fixa
                decoration: BoxDecoration(
                  color: const Color(0x40ffffff), // Cor de fundo
                  borderRadius: BorderRadius.circular(8), // Cantos arredondados
                ),
                child: Center(
                  child: DropdownButton<String>(
                    underline: const SizedBox(),
                    hint: const Icon(
                      Icons.location_on,
                      color: Colors.blue,
                      size: 40,
                    ),
                    dropdownColor: const Color(0x40ffffff),
                    //borderRadius: BorderRadius.circular(12),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    alignment: Alignment.center,
                    value: selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedItem = newValue;
                      });
                    },
                    items: _estados.map<DropdownMenuItem<String>>((String uf) {
                      return DropdownMenuItem<String>(
                        value: uf,
                        child: Text(
                          uf,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ]),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () => cityCoutry(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Cor de fundo do botão
                foregroundColor: Colors.white, // Cor do texto
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0), // Definir altura do botão
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(12.0), // Cantos arredondados
                ),
                minimumSize:
                    const Size(double.infinity, 48), // Largura total da página
                elevation: 8.0, // Intensidade da elevação para o efeito 3D
                shadowColor: Colors.black.withOpacity(0.3), // Cor da sombra
              ),
              child: const Text(
                'Buscar',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (verifyController)
              Column(
                children: [
                  if (textController!.isNotEmpty)
                    Text(
                      textController!,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                          fontSize: 11),
                    ),
                  if (textUf!.isNotEmpty)
                    Text(
                      textUf!,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                          fontSize: 11),
                    ),
                ],
              ),
            if (cityPlusCoutry != null)
              FutureBuilder<Map>(
                  future: ApiClima().cityWeather(cityPlusCoutry!),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return const Text(
                          "Carregando dados....",
                          style: TextStyle(color: Colors.blue, fontSize: 25),
                          textAlign: TextAlign.center,
                        );
                      case ConnectionState.active:
                        return const Center(child: CircularProgressIndicator());
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          print(snapshot.data);
                          return const Text(
                            "Erro ao carregar os dados. Cidade ou estado invalidos, no nome da cidade nao use: simbolos e acentos. Deve conter os espaços!",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          );
                        } else {
                          meteorological = snapshot.data!["results"];
                          return GestureDetector(
                            child: Container(
                              height: 65,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0x40ffffff),
                              ),
                              child: Center(
                                child: Text(
                                  cityPlusCoutry!,
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 20),
                                  //textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            onTap: () => Navigator.of(context).pushNamed(
                                AppRoutes.CITY_SEARCH,
                                arguments: meteorological),
                          );
                        }
                    }
                  }),
          ],
        ),
      ),
    );
  }
}
