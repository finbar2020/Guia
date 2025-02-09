import 'dart:convert';
import 'package:flutter/services.dart'; // Importando para acessar o arquivo local
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

class ApiClient {
  final String? authToken;

  ApiClient({this.authToken});

  static String get baseUrl {
    switch (FlavorConfig.instance.name) {
      case "prod":
        return FlavorConfig.instance.variables["baseUrl"];
      case "hom":
        return FlavorConfig.instance.variables["baseUrl"];
      case "dev":
        return FlavorConfig.instance.variables["baseUrl"];
      default:
        return "";
    }
  }

  Future<dynamic> processJsonData(String jsonData) async {
    try {
      final jsonMap = jsonDecode(jsonData);
      return jsonMap;
    } catch (e) {
      debugPrint('Erro ao processar JSON: $e');
      throw Exception('Erro ao processar JSON: $e');
    }
  }

  // Método para buscar dados de um arquivo JSON local
  Future<dynamic> fetchMockData() async {
    try {
      // Carregar o arquivo mock.json
      final String jsonString = await rootBundle.loadString('assets/mock.json');
      final jsonMap = await processJsonData(jsonString);
      return jsonMap;
    } catch (e) {
      debugPrint('Erro ao carregar mock.json: $e');
      throw Exception('Erro ao carregar mock.json: $e');
    }
  }
}
