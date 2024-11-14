import 'package:flutter/material.dart';

class SearchCityPage extends StatefulWidget {
  const SearchCityPage({super.key});

  @override
  State<SearchCityPage> createState() => _SearchCityPageState();
}

class _SearchCityPageState extends State<SearchCityPage> {
  String? selectedItem;
  final _cityController = TextEditingController();
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

  void cityCoutry() {
    String city = capitalizeEachWord(_cityController.text);
    setState(() {
      cityPlusCoutry = "$city,$selectedItem";
    });
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
        title: const Text('Encontre a Localização'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Color.fromARGB(255, 59, 59, 59), Color(0xFF000000)],
          ),
        ),
        child: Column(
          children: [
            const Text(
              'encontre a área da cidade onde você deseja saber as informações meteorológicas detalhadas neste momento',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            Row(children: [
              TextField(
                  controller: _cityController,
                  decoration: InputDecoration(
                    labelText: 'city',
                    filled: true,
                    fillColor: const Color(0x40ffffff), // Cor de fundo
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
              const SizedBox(
                width: 10,
              ),
              DropdownButton<String>(
                hint: const Icon(
                  Icons.location_on,
                  color: Colors.blue,
                ),
                dropdownColor: const Color(0x40ffffff),
                borderRadius: BorderRadius.circular(12),
                style: const TextStyle(color: Colors.white),
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
            ]),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {},
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
            if (cityPlusCoutry != null)
              Container(
                height: 16,
                width: double.infinity,
                color: const Color(0x40ffffff),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: Text(
                  cityPlusCoutry!,
                  style: const TextStyle(color: Colors.blue),
                ),
              )
          ],
        ),
      ),
    );
  }
}
