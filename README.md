# Documentação do Projeto

## Nome do Projeto: **ClimaDay 🌤️**

### Resumo do Projeto
Este repositório contém todo o código-fonte do aplicativo de clima que estou desenvolvendo em Flutter. O objetivo deste projeto é criar um app interativo e fácil de usar, que forneça informações meteorológicas atualizadas, como temperatura, previsão semanal, condições climáticas detalhadas, e outros dados úteis para o usuário. O projeto inclui integração com APIs de clima e exibe uma interface moderna, com gráficos e recursos de geolocalização para mostrar o clima em locais próximos.

### Índice
1. [Introdução](#introdução)
2. [Configuração do Ambiente](#configuração-do-ambiente)
3. [Instalação](#instalação)
4. [Estrutura do Projeto](#estrutura-do-projeto)
5. [Funcionalidades](#funcionalidades)
6. [Padrões de Código](#padrões-de-código)
7. [Dependências](#dependências)
8. [Deployment](#deployment)
9. [Manutenção e Atualizações](#manutenção-e-atualizações)
10. [Contribuição](#contribuição)
11. [Licença](#licença)

---

## Introdução
O "ClimaDay" ajuda pessoas a terem informações meteorologicas sem ter que entrar em um site. As funcionalidades incluem:
- Verificar dados climaticos local automaticamente atraves de geolocalização.
- Visualização dos proximos 7 dias.
- Pesquisar por outras cidades.
  
O projeto é feito usando Flutter e pode ser facilmente adaptado para dispositivos Android e iOS.

## Configuração do Ambiente

### Pré-requisitos
1. **Flutter SDK**: Versão 3.24.4 ou superior.
2. **Dart**: Versão 3.5.4 ou superior.
3. **Android Studio** ou **Xcode** para testes em dispositivos.
4. Emulador ou dispositivo físico para testes(obrigatorio por causa da geolocalização).
5. Localizador do celular tem que estar ativado.


## Instalação

1. Clone o repositório:
    ```bash
    git clone https://github.com/SavioVitorAlves/ClimaDay.git
    cd climaday
    ```

2. Instale as dependências:
    ```bash
    flutter pub get
    ```

3. Execute o projeto em um emulador ou dispositivo:
    ```bash
    flutter run
    ```

## Estrutura do Projeto

```plaintext
climaday/
├── lib/
│   ├── main.dart                 # Arquivo principal do aplicativo
│   ├── screens/                  # Contém todas as telas do aplicativo
│   ├── services/                 # Serviço de notificação
│   ├── utils/                    # Utilitários e helpers
│   └── components/               # Widgets reutilizáveis
├── assets/                       # Assets do projeto (imagens, ícones, fontes, etc.)
├── pubspec.yaml                  # Arquivo de dependências do Flutter
└── README.md                     # Documentação do projeto
```

## Funcionalidades

### 1. Tela Principal
- Apresenta os dados do local onde esta sendo acesado o app.
- Contem os dados analytics.
- Direciona para tela de previsoes.

### 2. Pesquisar Cidades
- Permite pesquisar cidades de um estado selecionado.

### 3. Previsões para os Proximos dias
- Permite o acesso dos dados da proxima semana a partir do dia atual.


## Padrões de Código
O projeto segue os padrões da [Guia de Estilo do Flutter](https://dart.dev/guides/language/effective-dart) com as seguintes práticas adicionais:
- **Naming Convention**: CamelCase para variáveis e PascalCase para classes.
- **Arquitetura**: Utilizamos o padrão MVVM (Model-View-ViewModel) para organizar o código.
- **Widgets Reutilizáveis**: Widgets comuns são armazenados em `componentes/` para reutilização e simplificação do código.

## Dependências

Abaixo estão as principais dependências usadas:

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^5.0.0
  intl: ^0.17.0
  http: ^0.13.3
  cloud_firestore: ^5.4.4
  firebase_auth: ^5.3.1
  firebase_core: ^3.6.0
  firebase_messaging: ^15.1.3
  flutter_local_notifications: ^17.2.4
  timezone: ^0.9.4
  permission_handler: ^11.2.0
  cupertino_icons: ^1.0.8
  fl_chart: ^0.69.0
  connectivity_plus: ^6.1.0
  flutter_launcher_icons: ^0.9.2

dev_dependencies:
  flutter_test:
    sdk: flutter
```



## Deployment

1. **iOS**:
    - Configurar `Xcode` com `flutter build ios`.
    - Arquivar o app no Xcode e seguir o fluxo de publicação para a App Store.

2. **Android**:
    - Configurar `gradle` com `flutter build apk --release`.
    - Subir o APK para a Google Play Store.

## Manutenção e Atualizações

### Bugs Conhecidos
- Quando modificar uma pessoa ou deletar tera que sair da pagina de modal e volta para a lista de pessoas do mes que ja estarão com as alterações.
- Quando uma pesso for marcada com verificada tem um delay na pagina principal.

### Próximas Atualizações
- Crição de tela de cadastro para suportar mais de um ususario.
- Adição da função de sexo da pessoa assim podendo criar novos graficos com essas informações.
- Roda função de notificação local

## Contribuição

### Regras de Contribuição
1. Faca um fork do repositorio.
2. Todos os dados adicionados no bando de dados delete apos as alterações e testes.
3. O banco de dados adicionado é o de testes caso queira usar o app crie um novo banco de dados no firebase database
4. Abra uma Pull Request com as alterações detalhadas.
5. Certifique-se de que todas as alterações seguem o padrão de código.


## Licença
Este projeto está licenciado sob a MIT License - consulte o arquivo `LICENSE` para mais detalhes.

---
