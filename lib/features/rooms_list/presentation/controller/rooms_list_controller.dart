import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:guia_moteis/features/rooms_list/domain/models/motel_model.dart';
import 'package:guia_moteis/core/intercepts/http/api_client.dart';

class RoomsListController extends ChangeNotifier {
  List<MotelModel> _moteis = [];

  List<MotelModel> get moteis => _moteis;

  ApiClient apiClient = ApiClient();

  Future<void> carregarMoteis() async {
    try {
      final data = await apiClient.fetchMockData();
      if (data is String) {
        final Map<String, dynamic> jsonData = jsonDecode(data);
        _processarMoteis(jsonData);
      } else if (data is Map<String, dynamic>) {
        _processarMoteis(data);
      } else {
        throw Exception('Dados no formato inesperado');
      }
    } catch (e) {
      debugPrint('Erro ao carregar os moteis: $e');
      throw Exception('Erro ao carregar os moteis');
    }
  }

  void _processarMoteis(Map<String, dynamic> data) {
    if (data['sucesso'] && data['data']['totalMoteis'] > 0) {
      _moteis = (data['data']['moteis'] as List)
          .map((motel) => MotelModel.fromJson(motel))
          .toList();
      notifyListeners();
    } else {
      throw Exception('Nenhum motel encontrado');
    }
  }
}
