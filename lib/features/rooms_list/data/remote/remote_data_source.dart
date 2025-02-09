import 'package:flutter/material.dart';
import 'package:guia_moteis/core/intercepts/http/api_client.dart';

class RemoteDataSource {
  final ApiClient apiClient;

  RemoteDataSource({ApiClient? apiClient})
      : apiClient = apiClient ?? ApiClient();

  Future<Map<String, dynamic>> getMotelDetails() async {
    try {
      final result = await apiClient.fetchMockData();

      if (result != null && result is Map<String, dynamic>) {
        return result;
      } else {
        throw Exception('Erro ao buscar os detalhes do motel');
      }
    } catch (e) {
      debugPrint('Erro ao buscar os detalhes do motel: $e');
      throw Exception('Erro ao buscar os detalhes do motel');
    }
  }
}
